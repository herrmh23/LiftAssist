import SwiftUI

enum ExerciseType {
    case lift
    case cardio
}

struct Exercise {
    var name: String
    var type: ExerciseType
}

let squat = Exercise(name: "Squat", type: .lift)
let deadLift = Exercise(name: "Deadlift", type: .lift)
let legExtention = Exercise(name: "Leg Extention", type: .lift)
let legCurl = Exercise(name: "Leg Curl", type: .lift)
let benchPress = Exercise(name: "Bench Press", type: .lift)
let barbellCurl = Exercise(name: "Barbell Curl", type: .lift)
let dumbellCurl = Exercise(name: "Dumbell Curl", type: .lift)
let shoulderPress = Exercise(name: "Shoulder Press", type: .lift)
let pecFly = Exercise(name: "Pec Fly", type: .lift)
let stairMaster = Exercise(name: "Stair Master", type: .cardio)
let run = Exercise(name: "Run", type: .cardio)
let treadmill = Exercise(name: "Treadmill", type: .cardio)

