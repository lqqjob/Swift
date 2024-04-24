//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by liqiang on 2024/4/24.
//

import Foundation
import MapKit
import LocalAuthentication

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var locations:[Location1]
        var selectedPlace:Location1?
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        var isUnlocked = false
        
        init(){
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location1].self, from: data)
            } catch {
                locations = [];
            }
        }
        
        func addLocation(at point:CLLocationCoordinate2D) {
            let newLocation = Location1(id: UUID(), name: "New Location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location:Location1) {
            guard let selectedPlace else {
                return
            }
            if let index = locations.firstIndex(of:selectedPlace) {
                locations[index] = location
            }
            save()
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic,.completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error:NSError?
            
            if  context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                    }
                }
            }else {
                
            }
        }
    }
    
}
