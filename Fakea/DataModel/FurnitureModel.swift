//
//  FurnitureModel.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-12.
//

import FirebaseFirestoreSwift
import SwiftUI

struct FurnitureModel: Codable, Identifiable {
    
    var brand: String = ""
    var category: String = ""
    var colors = [FurnitureColor]()
    var dimensions = FurnitureDimension()
    var discount: Int = 0
    var id: String = ""
    var images = [String]()
    var longDescription: String = ""
    var material: String = ""
    var model: String = ""
    var model3d: String = ""
    var price: Float = 0.0
    var quantity: Int = 1
    var rating: Float = 0.0
    var room: String = ""
    var shortDescription: String = ""
    var size: String = ""
    var stores = [String]()
    var style: String = ""
    
    func calculateFinalPrice () -> Float {
        return (price - (price * (Float(discount) / Float(100)))) * Float(quantity)
    }
    
}

struct FurnitureDimension: Codable {
    var depth: Float = 0.0
    var height: Float = 0.0
    var unit: String = "unit"
    var width: Float = 0.0
    
}

struct FurnitureColor: Codable, Hashable {
    var name: String = ""
    var colorRed: Int = 1
    var colorGreen: Int = 1
    var colorBlue: Int = 1
    var colorOpacity: Int = 1
    
    func getColor() -> Color {
        let r = Double(colorRed) / 255.0
        let g = Double(colorGreen) / 255.0
        let b = Double(colorBlue) / 255.0
        return Color(red: r, green: g, blue: b)
    }
    
}
