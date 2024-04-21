//
//  ContentView.swift
//  BucketList
//
//  Created by liqiang on 2024/4/20.
//

import SwiftUI
import MapKit

struct Location1 :Codable,Equatable,Identifiable {
    var id: UUID
    var name:String
    var description:String
    var latitude:Double
    var longitude:Double
    var coordinate:CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    static let example = Location1(id: UUID(), name: "Buckingham Palace", description: "Lit by over 40,000 lightbulbs.", latitude: 51.501, longitude: -0.141);
    static func ==(lhs:Location1,rhs:Location1) -> Bool{
        rhs.id == lhs.id
    }
}
struct ContentView: View {
    let startPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.757054, longitude: 114.240072), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
    @State private var locations = [Location1]()
    @State private var selectedPlace:Location1?
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
//                    Marker(location.name,coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44,height: 44)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                selectedPlace = location
                            }
                    }
                }
            }
                 .onTapGesture { position in
                     if let coordinate = proxy.convert(position,from: .local) {
                         let newLocation = Location1(id: UUID(), name: "New Location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                         locations.append(newLocation)
                     }
                 }
                 .mapStyle(.hybrid)
                 .sheet(item: $selectedPlace) {place in
                     EditView(location: place) { newLocation in
                         if let index = locations.firstIndex(of:place) {
                             locations[index] = newLocation
                         }
                     }
                 }
        }
    }
}

#Preview {
    ContentView()
}
