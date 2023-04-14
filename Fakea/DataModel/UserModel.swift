//
//  UserModel.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-12.
//


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
    
}

struct AddressModel: Codable {
    let address: String
    let name: String
    let postalCode: String
    let telephone: String
}

struct CreditCardModel: Codable {
    let cvv: String
    let expireDate: String
    let name: String
    let number: String
    let owner: String
}
