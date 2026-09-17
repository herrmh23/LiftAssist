import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                //background color
                Color(red: 59.0 / 255, green: 59.0 / 255, blue: 59.0 / 255)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    //header
                    Image("LiftAssistHeader")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 350)
                        .padding(.horizontal, 30)
                        
                        Text("Ready to Train?")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                                           
                 
                    
                    
                    //start workout button
                    NavigationLink(destination: WorkoutView()) {
                        
                        HomeButton(title: "Log Workout", subtitle: "Track a new training session", icon: "figure.strengthtraining.traditional")
                        

                    }
                    
                    NavigationLink(destination: CustomSessionView()) {
                        
                        HomeButton(title: "Create Workout Plan", subtitle: "Create re-usable workout plans", icon: "plus.circle")
                        
                    }
                    
                    
                    
                    
                    //track progress button
                    NavigationLink(destination: ProgressView()) {
                        
                        HomeButton(title: "Track Progres", subtitle: nil, icon: "chart.line.uptrend.xyaxis")
                        
                    }
                    
                }//end of vStack
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding()
                
            }
        }
    }
    
    
}//end of vStack

struct WorkoutView: View {
    
    var body: some View {
        
        VStack {
            
            Text("Workout")
            
            Spacer()
        }
    }
}

struct CustomSessionView: View {
    
    var body: some View {
        
        VStack {
            
            Text("Create Custom Workout Plan")
            
            Spacer()
        }
    }
}


struct ProgressView: View {
    
    var body: some View {
            
            VStack {
                
                Text("Progress")
                
                Spacer()
                
            }

        }
    }


//resuable home button
struct HomeButton: View {
   
    let title: String
    let subtitle: String?
    let icon: String
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            Image(systemName: icon)
                .font(.title2)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 3) {
                
                Text(title)
                    .font(.headline)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .opacity(0.8)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .foregroundStyle(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(red: 23.0 / 255, green: 23.0 / 255, blue: 23.0 / 255))
        .clipShape( RoundedRectangle(cornerRadius: 16))
    }
}


