//user face
//user name

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        ScrollView {
            
            VStack (spacing: 25) {
                
                //MARK: - Profile Header
               
                Image(systemName: "person.circle")
                    .resizable() // 1. Allows the icon to scale past text sizes
                    .aspectRatio(contentMode: .fit) // 2. Keeps the icon from stretching
                    .frame(width: 150, height: 150) // 3. Set your exact big size here
                    .foregroundStyle(.blue)
                
                Text("MarkH42")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Button("Edit Profile") {
                    print("Edit Profile")
                }
                .buttonStyle(.bordered)
                
                //MARK: - Personal Information
                
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Personal Information")
                        .font(.headline)
                    
                    HStack {
                        Image(systemName: "scalemass")
                        Text("Weight")
                        
                        Spacer()
                        
                        Text("165 lbs")
                            .foregroundStyle(.secondary)
                    }
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "ruler")
                        Text("Height")
                        
                        Spacer()
                        
                        Text("5'8\"")
                            .foregroundStyle(.secondary)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                //MARK: - Settings
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Settings")
                        .font(.headline)
                    
                    Button {
                        print("Change gym location")
                    } label: {
                        HStack {
                            Image(systemName: "location")
                            
                            Text("Gym Location")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                    
                    Divider()
                    
                    Button {
                        print("Change Password")
                    } label: {
                        HStack {
                            Image(systemName: "lock")
                            
                            Text("Change Password")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                //MARK: - Logout
                
//                Button("Log Out") {
//                    print("Log out")
//                }
//                .foregroundStyle(.red)
                NavigationLink("Log Out") {
                    LoginView()
                }
                .foregroundStyle(.red)
                
                Spacer()
                    
                
                
                
                
            }// close vStack
            .padding()

            //closings
        }

    }
}
