import SwiftUI

struct ProgressDataView: View {
    
    let exercise: Exercise
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 24) {
                
                //MARK -header
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(exercise.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Progress Overview")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                
                
                //MARK - stats
                
                HStack(spacing: 16) {
                    
                    statCard(
                        title: "Personal Best",
                        value: "205 lbs",
                        icon: "trophy.fill"
                    )
                    
                    statCard(
                        title: "Recent Best",
                        value: "205 lbs",
                        icon: "clock.fill"
                    )
                }
                
                
                
                // MARK: - Progress Graph
                // Temportary Image until action is created
                             
                             VStack(alignment: .leading, spacing: 12) {
                                 
                                 Text("Progress")
                                     .font(.title2)
                                     .fontWeight(.bold)
                                 
                                 Image("progressGraph")
                                     .resizable()
                                     .scaledToFit()
                                     .clipShape(
                                         RoundedRectangle(cornerRadius: 16)
                                     )
                             }
               
                
                //MARK - Recent Workouts
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Recent Workouts")
                        .font(.title2)
                        .fontWeight(.bold)

                    
                    workoutRow(date: "Sep 23", weight: "205 lbs", sets: "2 x 6")
                    
                    workoutRow(date: "Sep 16", weight: "195 lbs", sets: "2 x 10")
                    
                    workoutRow(date: "Sep 09", weight: "195 lbs", sets: "2 x 8")
                }//close vStack
                
                
                
                
            } // close vstack
        }//close scroll view
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        
    }// close body
    
    //MARK - Reusable stat card
    
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
    
    
    //MARK - resuable workoutRow
    
    func workoutRow(
        date: String,
        weight: String,
        sets: String
    ) -> some View {
        
        
        HStack {
            
            Text(date)
                .fontWeight(.medium)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(weight)
                    .fontWeight(.bold)
                
                Text(sets)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
}//close ProgressDataView

