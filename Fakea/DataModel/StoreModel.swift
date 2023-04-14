//
//  StoreModel.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-12.
//

import FirebaseFirestoreSwift

public struct StoreModel: Codable {
    
    @DocumentID var id: String?
    var latitude: Float = 0.0
    var longitude: Float = 0.0
    var name: String = ""
}
