import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
            ZStack {
                
                //background color
                //Color(red: 59.0 / 255, green: 59.0 / 255, blue: 59.0 / 255)
                    //.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    //header
                    Image("LiftAssistHeader")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 350)
                        .padding(.horizontal, 30)
                                           
                 
                }//end of vStack
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding()
                
            }
        }
    
    
    
}//end of vStack









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
        //.background(Color(red: 23.0 / 255, green: 23.0 / 255, blue: 23.0 / 255))
        .background(Color(.blue))
        .clipShape( RoundedRectangle(cornerRadius: 16))
    }
}

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
                LogWorkoutView()
            }
            .tabItem {
                Image(systemName: "figure.strengthtraining.traditional")
            }

            NavigationStack {
                ProgressView()
            }
            .tabItem {
                Image(systemName: "chart.line.uptrend.xyaxis")
            }
        }
    }
}
