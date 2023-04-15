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
    
    @ObservedObject var dataBase: FirestoreManager

    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 190/255, green: 188/255, blue:196/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("My favorites")
                        .font(.custom("LibreBaskerville-Bold", size: 30))
                        .foregroundColor(Color.black)
                    
                    HStack {}
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        ForEach(dataBase.furnitureFavorites) { furniture in
                            
                            NavigationLink(
                             destination: DetailsView(dataBase: dataBase, furniture: furniture),
                             label: {
                             FavoriteCardView(furniture: furniture)
                             })
                             .navigationBarHidden(true)
                             .foregroundColor(.white)
                        }
                    }
                    .navigationTitle("My Favorites")
                    .padding(.bottom)
                }
            }
        }
    }
        
}
                            
struct FavoriteCardView: View {
    let furniture: FurnitureModel
    //let size: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(
                url: URL(string: furniture.images[0]),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 200)
                },
                placeholder: {
                    ProgressView()
                }
            )
            VStack(alignment: .leading) {
                Text(furniture.model)
                    .font(.headline)
                    .foregroundColor(.black)
                HStack(spacing: 4.0) {
                    Image(systemName: "heart.fill")
                    Text("Price " + String(format: "%.2f", furniture.price))
                    if (furniture.discount > 0) {
                        Text("" + String(furniture.discount) + "% Off").foregroundColor(Color.red)
                    }
                }
                .foregroundColor(.black)
                .padding(.bottom,16)
                .padding(.horizontal, 16)
            }.padding(.horizontal, 8)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var dataBase = FirestoreManager()
        FavoritesView(dataBase: dataBase)
    }
}
