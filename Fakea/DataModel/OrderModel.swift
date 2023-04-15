//
//  OrderModel.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-12.
//

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
