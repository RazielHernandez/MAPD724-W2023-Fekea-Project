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

/*struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}*/


struct StoreMap: View {
    
    //let place: IdentifiablePlace
    //@State var region: MKCoordinateRegion
    
    @StateObject var mapData = MapViewModel()
    @State var locationManager = CLLocationManager()

    var body: some View {
        Map(mapData: mapData, locationManager: locationManager)
            
        
    }
}

struct StoreMap_Previews: PreviewProvider {
    static var previews: some View {
        StoreMap()
    }
}
