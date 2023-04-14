//
//  FurnitureModel.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-12.
//

import FirebaseFirestoreSwift

struct FurnitureModel: Codable {
    
    var brand: String = ""
    var category: String = ""
    var colors = [FurnitureColor]()
    var dimensions: FurnitureDimension
    var discount: Int = 0
    var id: String = ""
    var images = [String]()
    var longDescription: String = ""
    var material: String = ""
    var model: String = ""
    var model3d: String = ""
    var price: Float = 0.0
    var rating: Float = 0.0
    var room: String = ""
    var shortDescription: String = ""
    var size: String = ""
    var stores = [String]()
    var style: String = ""
    
}

struct FurnitureDimension: Codable {
    let depth: Float
    let height: Float
    let unit: String
    let width: Float
    
}

struct FurnitureColor: Codable {
    let name: String
    let colorRed: Int
    let colorGreen: Int
    let colorBlue: Int
    let colorOpacity: Int
    
    
}
