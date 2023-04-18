//
//  HomeItems.swift
//  Fakea
//
// Student Name: Carlos Hernandez Galvan
// Student ID: 301290263
//
// Student Name: Oscar Miralles Fernandez
// Student ID: 301250756
//
// Student Name: Yingda Zhang
// Student ID: 301275707
//
// Student Name: Carlos Norambuena
// Student ID: 301265667
//
// Student Name: Victor Quezada
// Student ID: 301286477

import SwiftUI
import MapKit

struct StoreMap: View {
    
    var stores = [StoreModel] ()
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 43.7,
                                       longitude: -79.37),
        span: MKCoordinateSpan(latitudeDelta: 0.6,
                               longitudeDelta: 0.6))

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: stores) {
            MapMarker(coordinate: $0.getCoordinate())
        }
    }
}

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct StoreMap_Previews: PreviewProvider {
    static var previews: some View {
        StoreMap()
    }
}
