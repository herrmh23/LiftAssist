//user face
//user name

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @State private var showChangePassword = false
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var photoData: Data?
    @AppStorage("profile.username") private var username = "MarkH42"
    @AppStorage("profile.weight") private var weight = "165"
    @AppStorage("profile.height") private var height = "5'8\""
    @State private var showEditProfile = false
    
    private static var photoFileURL: URL {
        FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        )[0]
        .appendingPathComponent("profile-photo.data")
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack (spacing: 25) {
                
                //MARK: - profile header
               
                //custon profile picture selector
                PhotosPicker(
                    selection: $selectedPhoto,
                    matching: .images
                ) {
                    Group {
                        if let photoData,
                           let image = UIImage(data: photoData) {

                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()

                        } else {
                            Image(systemName: "person.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.blue)
                        }
                    }
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                }
                .buttonStyle(.plain)
                
                Text(username)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Button("Edit Profile") {
                    showEditProfile = true
                }
                .buttonStyle(.bordered)
                .sheet(isPresented: $showEditProfile) {
                    EditProfileView(
                        username: $username,
                        weight: $weight,
                        height: $height
                    )
                }
                
                //MARK: - Personal Information
                
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Personal Information")
                        .font(.headline)
                    
                    HStack {
                        Image(systemName: "scalemass")
                        Text("Weight")
                        
                        Spacer()
                        
                        Text("\(weight) lbs")
                            .foregroundStyle(.secondary)
                    }
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "ruler")
                        Text("Height")
                        
                        Spacer()
                        
                        Text(height)
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
                    
//                    Button {
//                        print("Change gym location")
//                    } label: {
//                        HStack {
//                            Image(systemName: "location")
//                            
//                            Text("Gym Location")
//                            
//                            Spacer()
//                            
//                            Image(systemName: "chevron.right")
//                        }
//                    }
//                    
//                    Divider()
                    
                    Button {
                        showChangePassword = true
                    } label: {
                        HStack {
                            Image(systemName: "lock")
                            
                            Text("Change Password")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                    .sheet(isPresented: $showChangePassword){
                        ChangePasswordView()
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
        .task(id: selectedPhoto) {
                guard let selectedPhoto,
                      let data = try? await selectedPhoto.loadTransferable(
                          type: Data.self
                      ),
                      UIImage(data: data) != nil else {
                    return
                }

                // Update the displayed picture
                photoData = data

                // Create the directory if necessary
                try? FileManager.default.createDirectory(
                    at: Self.photoFileURL.deletingLastPathComponent(),
                    withIntermediateDirectories: true
                )

                // Save the picture to the device
                try? data.write(
                    to: Self.photoFileURL,
                    options: .atomic
                )
            }
            .onAppear {
                // Load the previously saved picture
                photoData = try? Data(
                    contentsOf: Self.photoFileURL
                )
            }

    }
}
