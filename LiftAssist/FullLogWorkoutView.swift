import SwiftUI

struct FullLogWorkoutView: View {
    
    @State private var workoutName = ""
    
    var body: some View {
       
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Log Today's Workout")
                .font(.title2)
                .fontWeight(.bold)
                
            
            //load template button
            Button {
                print("Template loaded")
            } label: {
                HomeButton(
                    title: "Load Template",
                    subtitle: "Use a pre-created workout",
                    icon: nil
                )
            }
            .buttonStyle(.plain)
            
            Text("New Workout")
                .font(.title2)
                .fontWeight(.bold)
            
            //MARK - Workout Name Text Field
                    Text("Workout Name")
                        .font(.headline)

                    TextField("Ex: Leg Day", text: $workoutName)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                  
            
            //MARK - Add exercises
            Button{
                print("Add Exercise clicked")
            } label: {
                VStack(spacing: 8) {
                    
                    Image(systemName: "plus.circle")
                        .font(.system(size: 40))
                    
                    Text("Add Exercise")
                        .font(.headline)
                }
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 25)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
          
            //save as template button
            Button {
                print("Template saved")
            } label: {
                HomeButton(
                    title: "Save As Template",
                    subtitle: nil,
                    icon: nil
                )
            }
            .buttonStyle(.plain)
            
            
                }
                .padding()
        
        Spacer()
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
