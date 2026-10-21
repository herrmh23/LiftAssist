import Foundation

struct WorkoutExercise: Identifiable, Codable {
    var id = UUID()
    var exercise: Exercise
    var weight: Double
    var sets: Int
    var reps: Int
}
