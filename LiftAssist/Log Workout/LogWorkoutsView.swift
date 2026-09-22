import SwiftUI

struct LogWorkoutView: View {
    
    var body: some View {
        
        VStack {
            
            Text("Log Today's Workout")
                .font(.title2)
                .fontWeight(.bold)
            
            
            NavigationLink(destination: NewWorkoutView()) {
                
                HomeButton(title: "Log New Workout", subtitle: "Record Today's Workout", icon: "plus.circle")
                
            }
            .padding()
            
            NavigationLink(destination: CreateTemplateView()) {
                
                HomeButton(title: "Workout Templates", subtitle: "Create a workout template", icon: "plus.circle")
                
            }
            .padding()
            
            
            
            
            Spacer()
        }
    }
}
