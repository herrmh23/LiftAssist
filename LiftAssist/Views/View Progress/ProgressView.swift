import SwiftUI

struct ProgressView: View {
    
    let exercises: [Exercise]
    
    var body: some View {
            
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("View Progress")
                    .font(.title2)
                    .fontWeight(.bold)
                
                ForEach(exercises) {
                    exercise in
                    
                    NavigationLink(destination: ProgressDataView(exercise: exercise)
                    ) {
                        HomeButton(title: exercise.name, subtitle: .none, icon:  "dumbbell")
                    }
                }
                  
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                } // end VStack view
                    .padding()
                
                Spacer()
                
            }

        }
    }
