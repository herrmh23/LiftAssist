import SwiftUI

struct HelpView: View {
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                //MARK: - Title
                Text("Help")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                //MARK: - Help to log a workout
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Logging a Workout")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Divider().padding(.horizontal)
                    
                    Text("Record your workouts as you train. Add exercises to your session and enter your sets, reps, and weight to keep a record of your training.")
                        .font(.subheadline)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                //MARK: - Help to use templates
                VStack(alignment: .leading, spacing: 15) {
                    Text("Workout Templates")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Divider().padding(.horizontal)
                    
                    Text("Create reusable workout templates for routines you perform regularly. Save exercises to a template, such as “Leg Day” or “Chest Day,” and quickly load the template when starting a workout.")
                        .font(.subheadline)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                //MARK: - Help to track progress
                VStack(alignment: .leading, spacing: 15) {
                    Text("Tracking Your Progress")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Divider().padding(.horizontal)
                    
                    Text("View your training history for individual exercises and see how your performance changes over time. Use the Progress page to select an exercise and review your previous workout data.")
                        .font(.subheadline)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                
                
                
                
                
                
                
                
            } // close vstack
            .padding()
        }// close scroll view
        
    }//close body
    
}//clsoe struct
