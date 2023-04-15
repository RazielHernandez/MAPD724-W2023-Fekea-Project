//
//  FirestoreManager.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-12.
//

import Firebase
import FirebaseCore
import SwiftUI
import FirebaseFirestore

class FirestoreManager: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var user: UserModel = UserModel()
    @Published var furnitureListAll = [FurnitureModel]()
    @Published var furnitureListBest = [FurnitureModel]()
    @Published var furnitureListSale = [FurnitureModel]()
    @Published var furnitureFavorites = [FurnitureModel]()
    @Published var errorMessage = ""
    @Published var stores = [StoreModel]()
    
    
    func insertUser(newUser: UserModel) {
        do {
            try db.collection("users_collection").document(newUser.email).setData(from: newUser) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("User added successfully")
                    self.user = newUser
                }
            }
        } catch {
            errorMessage = "Error on inser user"
            print(errorMessage)
        }
    }
    
    func updateUser(userToUpdate: UserModel) {
        do {
            try db.collection("users_collection").document(userToUpdate.email)
                .setData(from: userToUpdate, merge: true) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        } catch {
            errorMessage = "Error on update user"
            print(errorMessage)
        }
    }
    
    func logoutUser() {
        print("logout")
        self.user = UserModel()
    }
    
    func getUserById(login: String) {
        let docRef = db.collection("users_collection").document(login)
        
        docRef.getDocument(as: UserModel.self) { result in
            switch result {
            case .success(let user):
                self.user = user
                self.errorMessage = "nil"
            case .failure(let error):
                self.errorMessage = "Error decoding document: \(error.localizedDescription)"
            }
        }
    }
    
    func loginUser(login: String, password: String) {
        let docRef = db.collection("users_collection").document(login)
        docRef.getDocument(as: UserModel.self) { result in
            switch result {
            case .success(let user):
                if (user.password == password){
                    self.user = user
                    self.errorMessage = "nil"
                    self.getFurnituresFavorites(ids: self.user.favorites)
                }else {
                    self.errorMessage = "User or password are incorrect"
                }
            case .failure(let error):
                self.errorMessage = "Error decoding document: \(error.localizedDescription)"
            }
        }
    }
    
    func getFurnituresFavorites(ids: [String]) {
        db.collection("furniture_collection").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                do {
                    for document in querySnapshot!.documents {
                        if (ids.contains(document.documentID)) {
                            let furniture = try document.data(as: FurnitureModel.self)
                            print("Favorite \(furniture.id) added")
                            self.furnitureFavorites.append(furniture)
                            
                        }
                    }
                }
                catch {
                    print("Error on decoding furniture object")
                    print(error)
                }
            }
        }
    }
    
    func getAllFurniture() {
        db.collection("furniture_collection").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                do {
                    for document in querySnapshot!.documents {
                        let furniture = try document.data(as: FurnitureModel.self)
                        self.furnitureListAll.append(furniture)
                        if (furniture.discount > 0) {
                            self.furnitureListSale.append(furniture)
                        }
                        if (furniture.rating >= 4.5) {
                            self.furnitureListBest.append(furniture)
                        }
                        //print("\(document.documentID) => \(document.data())")
                    }
                }
                catch {
                    print("Error on decoding furniture object")
                    print(error)
                }
                
            }
        }
    }
    
    func getStoresByIds( ids: [String]) {
        db.collection("stores_collection").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                do {
                    for document in querySnapshot!.documents {
                        if (ids.contains(document.documentID)){
                            self.stores.append( try document.data(as: StoreModel.self) )
                            print("\(document.documentID) => \(document.data())")
                        }
                    }
                }
                catch {
                    print("Error on decoding store object")
                    print(error)
                }
                
            }
        }
    }
    
}
