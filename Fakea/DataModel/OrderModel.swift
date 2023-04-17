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

public struct OrderModel: Codable {
    
    @DocumentID var id: String?
    var deliveryDate: String
    var items = [FurnitureModel]()
    var orderDate: String
    var shipmentDate: String
    var status: String
    var total: Float
    var user: String
    
}
