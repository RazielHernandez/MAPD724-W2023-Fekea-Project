//
//  ContentView.swift
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
// Fakea is an app similar to Ikea app to buy fornitures with delivery services,
// notifications and AR to see how the fournitues looks in a space.

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 190/255, green: 188/255, blue:196/255)
                .edgesIgnoringSafeArea(.all)
            
            TabView {
                HomeView()
                    .tabItem() {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                SearchView()
                    .tabItem() {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                FavoritesView()
                    .tabItem() {
                        Image(systemName: "star.fill")
                        Text("Favorites")
                    }
                CartView()
                    .tabItem() {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                UserView()
                    .tabItem() {
                        Image(systemName: "person.fill")
                        Text("User")
                    }
            }
            .padding(5)
            .accentColor(Color(red: 50/255, green: 50/255, blue:50/255))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
