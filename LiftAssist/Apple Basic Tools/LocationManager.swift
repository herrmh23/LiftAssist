//
//  LocationManager.swift
//  MarketPlace
//
//  Created by Sayeda Farzana Aktar on 9/23/26.
//

import Foundation
import CoreLocation
import Combine

// LocationManager handles location permission
// and retrieves the user's current location.
class LocationManager: NSObject,
                       ObservableObject,
                       CLLocationManagerDelegate {

    // CLLocationManager communicates with the device's
    // location services (GPS, Wi-Fi, etc.).
    private let manager = CLLocationManager()

    // Stores the user's current latitude and longitude.
    // @Published allows SwiftUI views to automatically
    // update when the location changes.
    @Published var location: CLLocationCoordinate2D?

    // Initializes the LocationManager.
    override init() {
        super.init()

        // Sets this class as the delegate.
        // This allows the class to receive location updates.
        manager.delegate = self

        // Requests the highest available location accuracy.
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }

    // Call this function when the app needs
    // permission to access the user's location.
    func requestLocationAccess() {

        // Ask the user for permission to access location
        // while the app is being used.
        manager.requestWhenInUseAuthorization()

        // Start receiving location updates.
        manager.startUpdatingLocation()
    }

    // This delegate method is automatically called
    // whenever CLLocationManager receives new location data.
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {

        // Get the most recent location from the array.
        if let latestLocation = locations.last {

            // Store only the latitude and longitude coordinates.
            location = latestLocation.coordinate
        }
    }
}

