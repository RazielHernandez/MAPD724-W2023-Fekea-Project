//
//  FavoritesView.swift
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
// Show user favorites

import SwiftUI

struct FavoritesView: View {
    let favorites = [
        FavoritesItems(id: 1, title: "Chair One", image: "chair", price: 45.5, discount: 0),
        FavoritesItems(id: 2, title: "Chair Two", image: "chair2", price: 50.52, discount: 10),
        FavoritesItems(id: 3, title: "Chester", image: "chester", price: 150.5, discount: 5),
        FavoritesItems(id: 4, title: "Lamp", image: "lamp", price: 15, discount: 0)
    ]

    var body: some View {
       ZStack {
           Color(red: 190/255, green: 188/255, blue:196/255)
               .edgesIgnoringSafeArea(.all)
           
            VStack(alignment: .leading, spacing: 16) {
                Text("My favorites")
                    .font(.custom("LibreBaskerville-Bold", size: 30))
                    .foregroundColor(Color.black)
                
                HStack {}
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(favorites) { favorite in
                        VStack(alignment: .leading, spacing: 16) {
                            Image(favorite.image)
                                .resizable()
                                .frame(width: 350, height: 200)
                            VStack(alignment: .leading) {
                                Text(favorite.title)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                HStack(spacing: 4.0) {
                                    Image("star-icon")
                                    Text("  Price " + String(format: "%.2f", favorite.price))
                                    if (favorite.discount > 0) {
                                        Text("  Disc. " + String(format: "%.2f", favorite.discount) + "%").foregroundColor(Color.red)
                                    }
                                }.foregroundColor(.black)
                                    .padding(.bottom,16)
                            }.padding(.horizontal, 8)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 24.0))
                    }
                }
                .navigationTitle("My Favorites")
                .padding(.bottom)
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
