import SwiftUI

//enum ExerciseType: String, Codable {
//    case lift
//    case cardio
//}

struct Exercise: Identifiable, Codable {
    var id = UUID()
    var name: String
}

var exercises = [
    Exercise(name: "Squat"),
   Exercise(name: "Deadlift"),
    Exercise(name: "Leg Extention"),
    Exercise(name: "Leg Curl"),
    Exercise(name: "Bench Press"),
    Exercise(name: "Barbell Curl"),
    Exercise(name: "Dumbell Curl"),
    Exercise(name: "Shoulder Press"),
    Exercise(name: "Pec Fly"),

        ]


