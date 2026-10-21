import Foundation

struct ExerciseProgress: Identifiable {
    var id = UUID()
    var date: Date
    var weight: Double
    var sets: Int
    var reps: Int
}


