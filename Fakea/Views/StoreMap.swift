//
//  StoreMap.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-15.
//

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
