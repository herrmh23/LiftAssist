import Foundation

// Development/demo data only. Do not run this automatically on app launch.
enum SampleWorkoutData {

    // Replaces saved workouts only when explicitly called.
    static func replaceWithDemoWorkouts() {
        let store = WorkoutStore()
        let workouts = generateWorkouts()
        guard workouts.count == 32 else {
            print("Demo generation failed; existing workouts were preserved.")
            return
        }

        store.clearAllWorkouts()
        for workout in workouts {
            store.saveWorkout(workout)
        }
        print("Loaded \(workouts.count) demo workouts.")
    }

    static func generateWorkouts(referenceDate: Date = Date()) -> [Workout] {
        let calendar = Calendar.current
        let startOfToday = calendar.startOfDay(for: referenceDate)
        // Monday of this week, using Calendar's weekday numbering (Sun = 1).
        let weekday = calendar.component(.weekday, from: startOfToday)
        let daysSinceMonday = (weekday + 5) % 7
        guard let thisMonday = calendar.date(byAdding: .day, value: -daysSinceMonday, to: startOfToday) else {
            return []
        }

        // (weekday offset, workout title, exercise name, starting weight, sets, reps)
        let plans: [(day: Int, name: String, lifts: [(String, Double, Int, Int)])] = [
            (0, "Chest Day", [
                ("Bench Press", 115, 3, 8),
                ("Incline Bench Press", 85, 3, 10),
                ("Chest Fly", 30, 3, 12)
            ]),
            (1, "Back Day", [
                ("Deadlift", 185, 3, 5),
                ("Barbell Row", 95, 3, 8),
                ("Lat Pulldown", 90, 3, 10)
            ]),
            (3, "Leg Day", [
                ("Squat", 145, 3, 8),
                ("Leg Press", 225, 3, 10),
                ("Leg Curl", 60, 3, 12)
            ]),
            (4, "Shoulder Day", [
                ("Overhead Press", 65, 3, 8),
                ("Lateral Raise", 15, 3, 12),
                ("Rear Delt Fly", 15, 3, 12)
            ])
        ]

        var result: [Workout] = []
        for weekIndex in 0..<8 {
            // Week 0 is seven weeks ago; week 7 is last week.
            let weeksAgo = 8 - weekIndex
            for (planIndex, plan) in plans.enumerated() {
                let dayOffset = -(weeksAgo * 7) + plan.day
                guard let date = calendar.date(byAdding: .day, value: dayOffset, to: thisMonday) else {
                    continue
                }
                let exercises = plan.lifts.enumerated().map { liftIndex, lift in
                    // Consistent small variations plus gradual progression.
                    let increase = (lift.1 >= 100 ? 5.0 : 2.5) * Double(weekIndex)
                    let variation = ((weekIndex + liftIndex + planIndex) % 5 == 0) ? -2.5 : 0.0
                    return WorkoutExercise(
                        exercise: Exercise(name: lift.0),
                        weight: lift.1 + increase + variation,
                        sets: lift.2,
                        reps: lift.3 - ((weekIndex + liftIndex) % 6 == 0 ? 1 : 0)
                    )
                }
                result.append(Workout(name: plan.name, date: date, exercises: exercises))
            }
        }
        return result.sorted { $0.date < $1.date }
    }
}
