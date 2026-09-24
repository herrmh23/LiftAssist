import SwiftUI


//MARK - navigation bar
struct ContentView: View {
    

    var body: some View {
        TabView {

            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
            }

            NavigationStack {
                //LogWorkoutView()
                FullLogWorkoutView()
            }
            .tabItem {
                Image(systemName: "figure.strengthtraining.traditional")
            }

            NavigationStack {
                ProgressView(exercises: exercises)
            }
            .tabItem {
                Image(systemName: "chart.line.uptrend.xyaxis")
            }
        }
    }
}
