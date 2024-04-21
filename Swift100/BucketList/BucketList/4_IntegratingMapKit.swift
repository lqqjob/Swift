//
//  IntegratingMapKit.swift
//  BucketList
//
//  Created by liqiang on 2024/4/20.
//

import SwiftUI
import MapKit
struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
struct IntegratingMapKit: View {
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    var body: some View {
        VStack {
            MapReader { proxy in
                
                Map(position: $position) {
                    ForEach(locations) {location in /*Marker(location.name,coordinate: location.coordinate)*/
                        
                        Annotation(location.name, coordinate: location.coordinate) {
                            Text(location.name)
                                .font(.headline)
                                .padding()
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                        .annotationTitles(.hidden)
                        
                    }
                }
                .mapStyle(.hybrid(elevation: .realistic))
                .onMapCameraChange {context in
//                    print(context.region)
                }
                .onTapGesture { position in
                           if let coordinate = proxy.convert(position, from: .local) {
                               print(coordinate)
                           }
                       }
                
            }
            HStack(spacing: 50, content: {
                Button("Paris") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
//                114.240072,22.757054
                Button("承翰陶源") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 22.757054, longitude: 114.240072),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
            })
        }
    }
}

#Preview {
    IntegratingMapKit()
}
