//
//  CartView.swift
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
// View to show the items in the cart

import SwiftUI

struct CartView: View {
    let cartItems = [
        CartItems(id: 1, title: "Chair One", image: "chair", quantity: 1, price: 50.45, discount: 0),
        CartItems(id: 2, title: "Chester", image: "chester", quantity: 1, price: 150.50, discount: 5)
    ]
    
    var body: some View {
        ZStack {
            Color(red: 190/255, green: 188/255, blue:196/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Cart")
                    .font(.custom("LibreBaskerville-Bold", size: 30))
                    .foregroundColor(Color.black)
                    .padding(.leading)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Delivery Address")
                        Text("Elm Street, 25")
                    }.padding(16)
                    Image("cart")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing)
                }
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(cartItems) { cartItem in
                        VStack(alignment: .leading, spacing: 16) {
                            Image(cartItem.image)
                                .resizable()
                                .frame(width: 350, height: 250)
                            VStack(alignment: .leading) {
                                Text(cartItem.title)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.leading,8)
                                HStack(spacing: 4.0) {
                                    Text("Quantity  ")
                                    Image("minus")
                                    Text("  \(cartItem.quantity)  ")
                                    Image("plus")
                                    Text("  Price  $")
                                    Text(" " + String(format: "%.2f", cartItem.price))
                                }.foregroundColor(.black)
                                    .padding(.leading,10)
                                    .padding(.bottom,16)
                                if (cartItem.discount > 0) {
                                    Text("  Discount   " + String(format: "%.2f", cartItem.discount) + "%")
                                        .foregroundColor(Color.red)
                                        .padding(.bottom,16)
                                }
                            }.padding(.horizontal, 8)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 24.0))
                    }.padding(.leading)
                }
                
                Text("Taxes $44.49").padding(.leading)
                HStack {
                    Text("Total Amount $ 237.92").padding(.leading)
                    Image("buy").frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
