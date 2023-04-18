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

import FirebaseFirestoreSwift
import SwiftUI
import MapKit

public struct StoreModel: Codable, Identifiable {
    
    @DocumentID public var id: String?
    var latitude: Float = 0.0
    var longitude: Float = 0.0
    var name: String = ""
    
    func getCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: Double(self.latitude), longitude: Double(self.longitude))
    }
    
    /*func getMarker() -> StoreLocation {
        return StoreLocation(store: self)
    }*/
    
}

/*public struct StoreLocation: Identifiable {
    public var id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    init (store: StoreModel) {
        id = UUID()
        name = store.name
        coordinate = CLLocationCoordinate2D(latitude: Double(store.latitude), longitude: Double(store.longitude))
    }
}*/
