import Foundation

struct Workout: Identifiable,  Codable {
    var id = UUID()
    var name: String
    var date: Date
    var exercises: [WorkoutExercise]
}
