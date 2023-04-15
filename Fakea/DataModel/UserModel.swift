//
//  UserModel.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-12.
//

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
