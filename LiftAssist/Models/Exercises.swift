import SwiftUI

enum ExerciseType {
    case lift
    case cardio
}

struct Exercise: Identifiable {
    let id = UUID()
    var name: String
    var type: ExerciseType
}

var exercises = [
    Exercise(name: "Squat", type: .lift),
   Exercise(name: "Deadlift", type: .lift),
    Exercise(name: "Leg Extention", type: .lift),
    Exercise(name: "Leg Curl", type: .lift),
    Exercise(name: "Bench Press", type: .lift),
    Exercise(name: "Barbell Curl", type: .lift),
    Exercise(name: "Dumbell Curl", type: .lift),
    Exercise(name: "Shoulder Press", type: .lift),
    Exercise(name: "Pec Fly", type: .lift),
    Exercise(name: "Stair Master", type: .cardio),
    Exercise(name: "Run", type: .cardio),
    Exercise(name: "Treadmill", type: .cardio),
        ]


