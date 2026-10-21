import SwiftUI

struct LogExerciseDataView: View {
    
    @State private var weight = ""
    @State private var sets = ""
    @State private var reps = ""
    @State private var saveErrorMessage = ""
    @State private var showingSaveError = false
   
    
    var onAddExercise: (WorkoutExercise) -> Void
    
    let exercise: Exercise
    
    var existingLift: WorkoutExercise? = nil
    
    var body: some View {
        
        ScrollView {
         
            VStack(alignment: .leading, spacing: 20){
                
                Text(exercise.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
               //MARK: - Intake for weight
                workoutDataIntake(title: "Weight", defaultText: "000.0", value: $weight)
                
                
                //MARK: - Intake for sets
                workoutDataIntake(title: "Sets", defaultText: "0", value: $sets)
                
                //MARK: - Intake for reps
                workoutDataIntake(title: "Reps", defaultText: "00", value: $reps)
                

                //MARK: - Save button
                Button {
                    
                    guard let newWeight = Double(weight),
                          let newSets = Int(sets),
                          let newReps = Int(reps),
                          newWeight.isFinite,
                          newWeight >= 0,
                          newSets > 0,
                          newReps > 0 else {
                            saveErrorMessage = "Please enter valid exercise data"
                            showingSaveError = true
                            return
                    }
                    
                    var updatedLift = WorkoutExercise(
                        exercise: exercise,
                        weight: newWeight,
                        sets: newSets,
                        reps: newReps
                    )
                    
                    if let existingLift = existingLift {
                        updatedLift.id = existingLift.id
                    }
                    
                    onAddExercise(updatedLift)
                } label: {
                    ClickButton(title: "Add to Workout")
                }
                .alert("Cannot Save Exercise", isPresented: $showingSaveError) {
                    Button("OK", role: .cancel) {}
                }message: {
                    Text(saveErrorMessage)
                }
                
                
            }
            .padding()
        }
        .onAppear {
            
            if let lift = existingLift {
                weight = String(lift.weight)
                sets = String(lift.sets)
                reps = String(lift.reps)
            }
        }
    }

    
    
    
    //MARK: - resuable intake form
    func workoutDataIntake(
        title: String,
        defaultText: String,
        value: Binding<String>
    ) -> some View {
        HStack(spacing: 16) {
            Text(title)
                .fontWeight(.medium)

            Spacer()

            TextField(defaultText, text: value)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 75)
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    
    //MARK: - Function to convert strings to int/double values
    func createWorkoutExercise() -> WorkoutExercise? {
        
        guard let enteredWeight = Double(weight),
                let enteredSets = Int(sets),
                let enteredReps = Int(reps),
                enteredWeight >= 0,
                enteredSets > 0,
                enteredReps > 0 else {
            return nil
        }
        
        return WorkoutExercise(exercise: exercise,
                               weight: enteredWeight,
                               sets: enteredSets,
                               reps: enteredReps
        )
                
    }
        

}
    

