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
import FirebaseFirestoreSwift

struct UserModel: Codable {
    
    @DocumentID var id: String?
    var addresses = [AddressModel]()
    var basket = [FurnitureModel]()
    var creditCards = [CreditCardModel]()
    var email: String = ""
    var enable: Bool = false
    var favorites = [String]()
    var lastName: String = ""
    var login: String = ""
    var name: String = ""
    var password: String = ""
    var telephone: String = ""
    var type: String = ""
    
    func calculateTotalBasket() -> Float {
        var result = Float(0)
        for item in basket {
            result = result + item.calculateFinalPrice()
        }
        return result
    }
    
}

struct AddressModel: Codable {
    var address: String
    var name: String
    var postalCode: String
    var telephone: String
}

struct CreditCardModel: Codable {
    var cvv: String
    var expireDate: String
    var name: String
    var number: String
    var owner: String
}
