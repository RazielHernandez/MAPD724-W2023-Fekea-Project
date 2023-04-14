//
//  HomeView.swift
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
// Home user View

import SwiftUI

struct HomeView: View {
    
    //@UIApplicationDelegateAdaptor(FakeaApp.self) var delegate
    
    let itemCategories = [
        HomeItems(id: 1, title: "New products", image: "chair"),
        HomeItems(id: 2, title: "Special Offers", image: "lamp"),
        HomeItems(id: 3, title: "Outlet", image: "chester")
    ]
    
    let itemList = [
        HomeItems(id: 1, title: "Classic chair", image: "chair"),
        HomeItems(id: 2, title: "Modern chair", image: "chair2"),
        HomeItems(id: 3, title: "Modetn Lamp", image: "lamp"),
        HomeItems(id: 4, title: "Vintage Chester", image: "chester")
    ]
    
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Bathroom", "Livingroom", "Bedrrom", "Kitchen"]
    
    var body: some View {
        ZStack {
            Color(red: 190/255, green: 188/255, blue:196/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                LazyVStack(alignment: .leading){
                    Text("Home")
                        .font(.custom("LibreBaskerville-Bold", size: 30))
                        .foregroundColor(Color.black)
                }.frame(height: 50)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 10) {
                        ForEach(itemCategories) { items in
                            VStack(alignment: .leading, spacing: 16) {
                                Image(items.image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Text(items.title)
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                        }
                    }.padding(.leading)
                }.frame(height:135)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 5) {
                        ForEach(0 ..< categories.count, id: \.self) { i in
                            CategoryView(isActive: i == selectedIndex, text: categories[i])
                                .onTapGesture {
                                    selectedIndex = i
                                }
                        }
                            
                    }.padding(.leading)
                }.frame(height:40)
                
                VStack(alignment: .leading, spacing: 16) {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(itemList) { item in
                            VStack(alignment: .leading, spacing: 16) {
                                Image(item.image)
                                    .resizable()
                                    .frame(width: 350, height: 200)
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                }.padding(.horizontal, 8)
                            }
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 24.0))
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
