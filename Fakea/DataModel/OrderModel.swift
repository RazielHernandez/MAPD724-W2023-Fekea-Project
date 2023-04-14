//
//  OrderModel.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-12.
//

import FirebaseFirestoreSwift

public struct OrderModel: Codable {
    
    @DocumentID var id: String?
    let deliveryDate: String
    var items = [FurnitureModel]()
    let orderDate: String
    let shipmentDate: String
    let status: String
    let total: Float
    let user: String
    
}
