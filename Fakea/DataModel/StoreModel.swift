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

public struct StoreModel: Codable {
    
    @DocumentID var id: String?
    var latitude: Float = 0.0
    var longitude: Float = 0.0
    var name: String = ""
}
