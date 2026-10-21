
import Foundation

struct ChatRequest: Encodable {
    let message: String
    let workoutContext: String
}

struct ChatResponse: Decodable {
    let reply: String
}

enum ChatBotError: LocalizedError {
    case invalidResponse
    case serverError(String)

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response from server."
        case .serverError(let message):
            return message
        }
    }
}

struct ChatBotService {

    func sendMessage(_ message: String) async throws -> String {

        guard let url = URL(
            string: "http://127.0.0.1:5000/chat"
        ) else {
            throw ChatBotError.invalidResponse
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        request.httpBody = try JSONEncoder().encode(
            ChatRequest(message: message, workoutContext: getWorkoutContext())
        )

        request.timeoutInterval = 30

        let (data, response) = try await URLSession.shared.data(
            for: request
        )

        guard let httpResponse = response as? HTTPURLResponse else {
            throw ChatBotError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw ChatBotError.serverError(
                "Server error: \(httpResponse.statusCode)"
            )
        }

        let result = try JSONDecoder().decode(
            ChatResponse.self,
            from: data
        )

        return result.reply
    }
    
    
    //MARK: - function to give chatbot workout history
    private func getWorkoutContext() -> String {

        let workouts = WorkoutStore().loadWorkouts()

        let recentWorkouts = workouts
            .sorted { $0.date > $1.date }
            .prefix(15)

        guard !recentWorkouts.isEmpty else {
            return "No workout history available."
        }

        var context = "Recent workout history:\n"

        for workout in recentWorkouts {
            context += "\nWorkout: \(workout.name)\n"
            context += "Date: \(workout.date.formatted(date: .abbreviated, time: .omitted))\n"

            for lift in workout.exercises {
                context += """
                - \(lift.exercise.name): \(lift.weight) lbs,
                  \(lift.sets) sets of \(lift.reps) reps

                """
            }
        }

        return context
    }
}
