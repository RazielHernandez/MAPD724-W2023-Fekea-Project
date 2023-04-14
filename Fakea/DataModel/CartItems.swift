//
//  CartItems.swift
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
//
// Model to store items in cart

struct CartItems: Identifiable {
    var id: Int
    var title: String
    var image: String
    var quantity: Int
    var price: Double
    var discount: Double
}
