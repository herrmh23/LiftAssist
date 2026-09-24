import SwiftUI

struct ProgressView: View {
    
    let exercises: [Exercise]
    
    var body: some View {
            
        ScrollView {
            VStack {
                
                ForEach(exercises) {
                    exercise in
                    
                    NavigationLink(destination: ProgressDataView(exercise: exercise)
                    ) {
                        HomeButton(title: exercise.name, subtitle: .none, icon: exercise.type == .lift ? "dumbbell" : "figure.run")
                    }
                }
                  
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                } // end VStack view
                
                
                
                
                
                
                
//                NavigationLink(destination: ProgressDataView()) {
//                    
//                    HomeButton(title: "Squat", subtitle: .none, icon: "dumbbell")
//                }
//                
//                NavigationLink(destination: PlaceHolderView()) {
//                    
//                    HomeButton(title: "Deadlift", subtitle: .none, icon: "dumbbell")
//                }
//                
//                NavigationLink(destination: PlaceHolderView()) {
//                    
//                    HomeButton(title: "Leg Extention", subtitle: .none, icon: "dumbbell")
//                }
//                
//                NavigationLink(destination: PlaceHolderView()) {
//                    
//                    HomeButton(title: "Leg Curl", subtitle: .none, icon: "dumbbell")
//                }
//                
//                NavigationLink(destination: PlaceHolderView()) {
//                    
//                    HomeButton(title: "Bench Press", subtitle: .none, icon: "dumbbell")
//                }
//                
//                NavigationLink(destination: PlaceHolderView()) {
//                    
//                    HomeButton(title: "Barbell Curl", subtitle: .none, icon: "dumbbell")
//                }
//                
//                NavigationLink(destination: PlaceHolderView()) {
//                    
//                    HomeButton(title: "Dumbbell Curl", subtitle: .none, icon: "dumbbell")
//                }
//                
//                NavigationLink(destination: PlaceHolderView()) {
//                    
//                    HomeButton(title: "Shoulder Press", subtitle: .none, icon: "dumbbell")
//                }
//                
//                NavigationLink(destination: PlaceHolderView()) {
//                    
//                    HomeButton(title: "Pec Fly", subtitle: .none, icon: "dumbbell")
//                }
//                
//                NavigationLink(destination: PlaceHolderView()) {
//                    
//                    HomeButton(title: "Stair Master", subtitle: .none, icon: "figure.run")
//                }
//                
//                NavigationLink(destination: PlaceHolderView()) {
//                    
//                    HomeButton(title: "Treadmill", subtitle: .none, icon: "figure.run")
//                }
                
                Spacer()
                
            }

        }
    }
