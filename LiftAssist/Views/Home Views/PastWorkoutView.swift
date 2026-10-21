import SwiftUI

struct PastWorkoutView: View {
    
    @EnvironmentObject var workoutStore: WorkoutStore

    let pastDayName: String
    let selectedDate: Date

    @State private var showDeleteWarning = false

    var pastWorkouts: [Workout] {
        workoutStore.workouts.filter { workout in
            Calendar.current.isDate(
                workout.date,
                inSameDayAs: selectedDate
            )
        }
    }
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text(pastDayName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
                
                ForEach(pastWorkouts) { workout in
                    workoutDisplayFeature(workout: workout)
                }
                
                
                
                
                
                
            } //Vstack close
            
        } //scrollview close
        
    } //body close
    
    //MARK: - Resuable workout viewer
    func workoutDisplayFeature(workout: Workout) -> some View {
        
        HStack {
            VStack(alignment: .leading) {
            Text(workout.name)
                .font(.title2)
                .fontWeight(.bold)
                
                Spacer()
        }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5) {
                
                    ForEach(workout.exercises) { lift in
                        VStack {
                            Text(lift.exercise.name)
                                .fontWeight(.bold)
                            
                            Text("\(lift.weight, specifier: "%.1f")lbs \(lift.sets) x \(lift.reps)")
                        }
                        .padding()
                }
                
                Button {
                    
                    showDeleteWarning = true

                    
                } label: {
                    Image(systemName: "trash")
                        .font(.headline)
                        .frame(width: 20)
                }
                .foregroundStyle(.red)
                .padding()
                .alert("Delete \(workout.name)?", isPresented: $showDeleteWarning) {
                    Button("No", role: .cancel) {
                        showDeleteWarning = false
                    }
                    Button("Delete", role: .destructive){
                        workoutStore.deleteWorkout(workout)
                    }
                } message: {
                    Text("Deleting a workout cannot be undone")
                }
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
    
    
}//pasworkoutview close

