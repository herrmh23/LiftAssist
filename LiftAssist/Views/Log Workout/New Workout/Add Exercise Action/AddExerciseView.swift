import SwiftUI

struct AddExerciseView: View {
    
    @State private var selectedExercise: Exercise?
    
    var onAddExercise: (WorkoutExercise) -> Void
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Add Exercise")
                    .font(.title2)
                    .fontWeight(.bold)
                
                ForEach(exercises) {
                    exercise in
                    
                    NavigationLink(destination: LogExerciseDataView(
                        onAddExercise: onAddExercise,
                        exercise: exercise)
                    ) {
                        HomeButton(
                            title: exercise.name,
                            subtitle: .none,
                            icon: "dumbbell"
                        )
                    }
                }
                
                
            }
            .padding()
        }
    }
}
