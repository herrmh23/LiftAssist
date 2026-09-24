import SwiftUI
import MapKit


struct HomeView: View {
    
    // Creates and manages the NetworkMonitor object.
    // @StateObject keeps the object alive while this view exists.
    // When isConnected changes, SwiftUI can update the interface.
    @StateObject private var networkMonitor = NetworkMonitor()
    
    // Creates and manages the LocationManager object.
    // It is used to request location permission and receive
    // the user's current location.
    @StateObject private var locationManager = LocationManager()
    
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 20) {
                
                //header
                Image("LiftAssistHeader")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 350)
                    .padding(.horizontal, 30)
                    
                
                HStack {
                    
                    // Display a different SF Symbol depending
                    // on the current network connection status.
                    Image(
                        systemName:
                            networkMonitor.isConnected
                        ? "wifi"
                        : "wifi.slash"
                    )
                    
                    // Display a message based on whether
                    // an internet connection is available.
                    Text(
                        networkMonitor.isConnected
                        ? "Internet Connected"
                        : "No Internet Connection"
                    )
                }
                
                // Makes the connection status text
                // and icon use headline formatting.
                .font(.headline)
                .foregroundStyle(.tertiary)
                
                
                
                
                NavigationLink(destination: PlaceHolderView()) {
                    
                    HomeButton(title: "Monday", subtitle: "Leg Day", icon: "dumbbell.fill")
                }
                
                NavigationLink(destination: PlaceHolderView()) {
                    
                    HomeButton(title: "Tuesday", subtitle: "Push", icon: "dumbbell.fill")
                }
                
                NavigationLink(destination: PlaceHolderView()) {
                    
                    HomeButton(title: "Wednesday", subtitle: "Pull", icon: "dumbbell.fill")
                }
                
                NavigationLink(destination: PlaceHolderView()) {
                    
                    HomeButton(title: "Thursday", subtitle: "Rest Day", icon: "bed.double.fill")
                }
                
                NavigationLink(destination: PlaceHolderView()) {
                    
                    HomeButton(title: "Friday", subtitle: "Leg day", icon: "dumbbell.fill")
                }
                
                NavigationLink(destination: PlaceHolderView()) {
                    
                    HomeButton(title: "Saturday", subtitle: "Core Day", icon: "dumbbell.fill")
                }
                
                NavigationLink(destination: PlaceHolderView()) {
                    
                    HomeButton(title: "Sunday", subtitle: "Rest Day", icon: "bed.double.fill")
                }
                
                
                
                
                
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.title2)
                            .foregroundStyle(.blue)
                        
                        VStack(alignment: .leading) {
                            Text("Your Gym")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("Save your gym to enable location features")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        } // close inner VStack
                    }// close map HStack
                    
                    Map {
                        if let location = locationManager.location {
                            Marker(
                                "My Location",
                                coordinate: location
                            )
                        }
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Button {
                        if let currentLocation = locationManager.location {
                            print("Gym latitude: \(currentLocation.latitude)")
                            print("Gym longitude: \(currentLocation.longitude)")
                        } else {
                            print("Location access denied")
                        }
                    } label: {
                        Label("Save Gym Location", systemImage: "location.fill")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }// close VStack
            .padding()
            

            
        }//end of scroll view
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        
        
        
        
    } // end of body View
} // end of home view

