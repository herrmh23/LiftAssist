import Foundation
import Combine

class WorkoutStore: ObservableObject {
    
    @Published var workouts: [Workout] = []
    
    private let saveKey = "savedWorkouts"
    
    init() {
        workouts = loadWorkouts()
    }

    // MARK: - Save Workout
    func saveWorkout(_ workout: Workout) {
        var updatedWorkouts = loadWorkouts()
        updatedWorkouts.append(workout)

        do {
            let encodedData = try JSONEncoder().encode(updatedWorkouts)
            UserDefaults.standard.set(encodedData, forKey: saveKey)

            workouts = updatedWorkouts

            print("Workout saved successfully!")
        } catch {
            print("Error saving workout: \(error)")
        }
    }

    // MARK: - Load Workouts
    func loadWorkouts() -> [Workout] {

        guard let savedData = UserDefaults.standard.data(forKey: saveKey) else {
            return []
        }

        do {
            return try JSONDecoder().decode([Workout].self, from: savedData)
        } catch {
            print("Error loading workouts: \(error)")
            return []
        }
    }
    
    
    //MARK: - Funcction to find all cases of a lift having been done and recording the date and weight
    func loadExerciseProgress(exerciseName: String) -> [ExerciseProgress] {
        
        let workouts = loadWorkouts()
        
        var progress: [ExerciseProgress] = []
        
        for workout in workouts {
            
            for lift in workout.exercises {
                
                if lift.exercise.name == exerciseName {
                    
                    let entry = ExerciseProgress(date: workout.date, weight: lift.weight, sets: lift.sets, reps: lift.reps)
                    
                    progress.append(entry)
                }
            }
        }
        
        return progress.sorted { $0.date < $1.date}
    }
    
    
    //MARK: - Function to delete logged workouts
    func deleteWorkout(_ workout: Workout) {
        
        var workouts = loadWorkouts()
        
        workouts.removeAll { $0.id == workout.id }
        
        do {
            let data = try JSONEncoder().encode(workouts)

            UserDefaults.standard.set(data, forKey: saveKey)

            self.workouts = workouts

            print("Workout deleted successfully!")
        } catch {
            print("Error deleting workout: \(error)")
        }
    }
    
    
    //MARK: - Lets me clear out workouts to clean up for my demonstration
    func clearAllWorkouts() {
        UserDefaults.standard.removeObject(forKey: saveKey)
        workouts = []
    }
}
