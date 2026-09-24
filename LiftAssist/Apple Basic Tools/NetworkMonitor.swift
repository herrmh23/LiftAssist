//
//  NetworkMonitor.swift
//  MarketPlace
//
//  Created by Sayeda Farzana Aktar on 9/23/26.
//

import Foundation
import Network
import Combine

// NetworkMonitor checks whether the device
// currently has an available internet/network connection.
class NetworkMonitor: ObservableObject {

    // NWPathMonitor observes changes in the device's
    // network connection status.
    private let monitor = NWPathMonitor()

    // Creates a background queue where the network
    // monitoring process will run.
    private let queue = DispatchQueue(label: "NetworkMonitor")

    // Stores the current internet connection status.
    // @Published allows SwiftUI views to automatically
    // update whenever this value changes.
    @Published var isConnected = false

    // Initializes the NetworkMonitor.
    init() {

        // This closure is automatically called whenever
        // the network connection status changes.
        monitor.pathUpdateHandler = { path in

            // Update the SwiftUI-related property
            // on the main thread.
            DispatchQueue.main.async {

                // .satisfied means that a network path
                // is currently available.
                // If connected, isConnected becomes true.
                // Otherwise, it becomes false.
                self.isConnected = path.status == .satisfied
            }
        }

        // Start monitoring the network connection
        // using the background queue.
        monitor.start(queue: queue)
    }
}
