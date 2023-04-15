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
    
    @ObservedObject var dataBase: FirestoreManager
    
    func checkout() {
        print("Buy")
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        var newOrder = OrderModel(deliveryDate: formatter.string(from: today), orderDate: formatter.string(from: today), shipmentDate: formatter.string(from: today), status: "Pending", total: dataBase.user.calculateTotalBasket(), user: dataBase.user.email)
        newOrder.items = dataBase.user.basket
        
        
        dataBase.insertNewOder(order: newOrder)
        
        dataBase.user.basket.removeAll()
    }
    
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
                    ForEach(dataBase.user.basket) { cartItem in
                        CartCardView(furniture: cartItem)
                    }
                    .padding(.leading)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                HStack {
                    Text(String(format: "Total amount $ %.2f", dataBase.user.calculateTotalBasket()))
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {checkout()}, label: {
                        Text("Checkout")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10.0)
                            .foregroundColor(Color.gray)
                            .lineLimit(1)
                    })
                    .disabled(!dataBase.user.enable)
                    .padding()
                }
                .background(Color.gray)
                .cornerRadius(40, corners: [.topRight, .topLeft])
                
            }
        }
    }
}

struct CartCardView: View {
    
    @State var furniture: FurnitureModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if (furniture.images.count > 0){
                AsyncImage(
                    url: URL(string: furniture.images[0]),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 250)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            } else {
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 350, height: 250)
            }
            
            VStack(alignment: .leading) {
                Text(furniture.model)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.leading,8)
                HStack(spacing: 4.0) {
                    Text("Quantity  ")
                    
                    Button(action:{
                        if (furniture.quantity > 1){
                            furniture.quantity = furniture.quantity - 1
                        }
                    }) {
                        Image(systemName: "minus")
                            .padding(.all,8)
                    }
                    .frame(width: 30, height: 30)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                    .foregroundColor(.black)
                    
                    Text("  \(furniture.quantity)  ")
                    
                    Button(action:{
                        if (furniture.quantity < 10){
                            furniture.quantity = furniture.quantity + 1
                        }
                    }) {
                        Image(systemName: "plus")
                            .padding(.all,8)
                    }
                    .background(Color.gray)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    
                    Text("  Price  $")
                    Text(" $" + String(format: "%.2f", furniture.calculateFinalPrice()))
                }
                .foregroundColor(.black)
                .padding(.leading,10)
                .padding(.bottom,16)
                if (furniture.discount > 0) {
                    Text("" + String(furniture.discount) + "% Off").foregroundColor(Color.red)
                        .foregroundColor(Color.red)
                        .padding(.leading,10)
                }
            }.padding(.horizontal, 8)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24.0))
    }
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var dataBase = FirestoreManager()
        CartView(dataBase: dataBase)
    }
}
