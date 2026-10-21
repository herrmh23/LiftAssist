import SwiftUI
import Charts

//PROBLEM TO SOLVE ********** If multiple workouts are recorded on the same day with different weights, how do I handle that?

struct ProgressDataView: View {
    
    let exercise: Exercise
    
    @State private var progressData: [ExerciseProgress] = []

    private let workoutStore = WorkoutStore()
    
    var personalBest: Double {
        progressData.map(\.weight).max() ?? 0
    }
    
    var recentWeight: Double {
        progressData.last?.weight ?? 0
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 24) {
                
                //MARK: -header
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(exercise.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Progress Overview")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                
                
                //MARK: - Record stats
                
                HStack(spacing: 16) {
                    
                    statCard(
                        title: "Personal Best",
                        value: progressData.isEmpty ? "-" : String(format: "%.1flbs", personalBest),
                        icon: "trophy.fill"
                    )
                    
                    statCard(
                        title: "Most Recent",
                        value: progressData.isEmpty ? "-" : String(format: "%.1flbs", recentWeight),
                        icon: "clock.fill"
                    )
                }
                
                
                
                // MARK: - Progress Graph displays max lift of each date
                if progressData.isEmpty {
                    
                    Text("No workouts with this exercise recorded yet")
                        .foregroundStyle(.secondary)
                } else {
                    
                    Chart(dailyMaxProgress) { entry in
                        
                        
                        
                        LineMark(x: .value("Date", entry.date),
                                 y: .value("Weight", entry.weight)
                        )
                        
                        PointMark(x: .value("Date", entry.date),
                                  y: .value("Weight", entry.weight)
                        )
                    }
                    .frame(height: 250)
                }
               
                
                //MARK: - Recent Workouts
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Past Workouts")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    //Prints daily lifts as groups by days
                    ForEach(dailyLiftsGrouped.keys.sorted(by: >), id: \.self) { date in

                        workoutRow(
                            date: date,
                            lifts: dailyLiftsGrouped[date] ?? []
                        )
                    }
                    
                }//close vStack
                
                
                
                
            } // close vstack
        }//close scroll view
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .onAppear {
            progressData = workoutStore.loadExerciseProgress(
                exerciseName: exercise.name
            )
        }
        
    }// close body
    
    //MARK: - Reusable stat card
    
    func statCard(
        title: String,
        value: String,
        icon: String
    ) -> some View {
        
        VStack(alignment: .leading, spacing:10) {
            
            Image(systemName: icon)
                .font(.title2)
            
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
        }
        .padding()
    }
    
    
    //MARK: - resuable workoutRow
    
    func workoutRow(
        date: Date,
        lifts: [ExerciseProgress]
    ) -> some View {

        VStack(alignment: .leading, spacing: 12) {

            // Date header
            Text(date.formatted(.dateTime.month(.abbreviated).day()))
                .font(.headline)

            Divider()

            // Display every lift recorded on this date
            ForEach(lifts) { lift in

                HStack {

                    Text(String(format: "%.1f lbs", lift.weight))
                        .fontWeight(.medium)

                    Spacer()

                    Text("\(lift.sets) x \(lift.reps)")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    //MARK: - function to find the maximum weight on a given day
    var dailyMaxProgress: [ExerciseProgress] {

        let grouped = Dictionary(grouping: progressData) { entry in
            Calendar.current.startOfDay(for: entry.date)
        }

        var results: [ExerciseProgress] = []

        for (_, entries) in grouped {

            if let heaviest = entries.max(by: { $0.weight < $1.weight }) {
                results.append(heaviest)
            }
        }

        return results.sorted { $0.date < $1.date }
    }
    
    
    
    var dailyLiftsGrouped: [Date: [ExerciseProgress]] {

        Dictionary(grouping: progressData) { entry in
            Calendar.current.startOfDay(for: entry.date)
        }
    }
    
}//close ProgressDataView

