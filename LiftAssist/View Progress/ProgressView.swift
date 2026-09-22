import SwiftUI

struct ProgressView: View {
    
    var body: some View {
            
            VStack {
                
                NavigationLink(destination: PlaceHolderView()) {
                    
                    HomeButton(title: "Bench Press", subtitle: .none, icon: "dumbbell")
                    
                }
                
                Spacer()
                
            }

        }
    }
