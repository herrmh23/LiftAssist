import SwiftUI
//import MapKit


struct HomeView: View {
    
    // Creates and manages the NetworkMonitor object.
    // @StateObject keeps the object alive while this view exists.
    // When isConnected changes, SwiftUI can update the interface.
    @StateObject private var networkMonitor = NetworkMonitor()
    
    // Creates and manages the LocationManager object.
    // It is used to request location permission and receive
    // the user's current location.
    @StateObject private var locationManager = LocationManager()
    
    @EnvironmentObject var workoutStore: WorkoutStore
    
    
    
    var body: some View {
        
 
        ScrollView {
            
            VStack(spacing: 20) {
                
                //header
                Image("LiftAssistHeader")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 350)
                    .padding(.horizontal, 30)
                    
                
                HStack {
                    
                    // Display a different SF Symbol depending
                    // on the current network connection status.
                    Image(
                        systemName:
                            networkMonitor.isConnected
                        ? "wifi"
                        : "wifi.slash"
                    )
                    
                    // Display a message based on whether
                    // an internet connection is available.
                    Text(
                        networkMonitor.isConnected
                        ? "Internet Connected"
                        : "No Internet Connection"
                    )
                }
                
                // Makes the connection status text
                // and icon use headline formatting.
                .font(.headline)
                .foregroundStyle(.tertiary)
                
                
                
                
                ForEach(datesForCurrentWeek(), id: \.self) { date in

                    let workouts = workoutsForDay(date)
                    let dayName = date.formatted(.dateTime.weekday(.wide))

                    if workouts.isEmpty {

                        ClickButtonAdvanced(
                            title: dayName,
                            subtitle: date > Date() ? "No workout logged" : "Rest Day",
                            icon: date > Date() ? "calendar" : "bed.double.fill"
                        )

                    } else {

                        NavigationLink(
                            destination: PastWorkoutView(
                                pastDayName: dayName,
                                selectedDate: date
                            )
                        ) {
                            HomeButton(
                                title: dayName,
                                subtitle: workouts.map(\.name).joined(separator: ", "),
                                icon: "dumbbell.fill"
                            )
                        }
                    }
                }
                
                Divider()
                
                NavigationLink {
                    ChatBotView()
                } label: {
                    HomeButton(
                        title: "AI Workout Assistant",
                        subtitle: "Get personalized workout suggestions",
                        icon: .none
                    )
                }
                
            }// close VStack
            .padding()
            

            
        }//end of scroll view
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        
        
        
        
    } // end of body View
    
    //MARK: - Function to find workouts based on their dates
    func workoutsForDay(_ date: Date) -> [Workout] {
        workoutStore.workouts.filter { workout in
            Calendar.current.isDate(
                workout.date,
                inSameDayAs: date
            )
        }
    }
    
    //MARK: - Function that returns an array of the 7 days of the week
    func datesForCurrentWeek() -> [Date] {
        let calendar = Calendar.current
        let today = Date()
        
        let weekday = calendar.component(.weekday, from: today)
        
        //Sunday = 1, Monday =2 ...
        let daysSinceMonday = (weekday + 5) % 7
        
        guard let monday = calendar.date(
            byAdding: .day,
            value: -daysSinceMonday,
            to:  calendar.startOfDay(for: today)
        ) else {
            return []
        }
        
        return (0..<7).compactMap { dayOffset in
            calendar.date(byAdding: .day, value: dayOffset, to: monday)
        }
    }
} // end of home view

