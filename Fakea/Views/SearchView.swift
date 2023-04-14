//
//  SearchView.swift
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
// View to search items by category

import SwiftUI

struct SearchView: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Bedroom", "Kitchen", "Living room", "Bathroom"]
    
    var body: some View {
        NavigationView{
            VStack {
                ZStack {
                    Color(red: 190/255, green: 188/255, blue:196/255)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack (alignment: .leading) {
                        TagLineView()
                            .padding()
                        
                        SearchBar()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count, id: \.self) { i in
                                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        ScrollView {
                            Text ("Regular")
                                .font(.custom("LibreBaskerville-Italic", size: 24))
                                .padding(.horizontal)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< 4) { index in
                                        NavigationLink(
                                            destination: DetailsView(),
                                            label: {
                                                CardView(image: Image("chair_\(index + 1)"),
                                                     size: 210)
                                        })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                    }
                                    .padding(.trailing)
                                }
                                .padding(.leading)
                            }
                            
                            Text ("Best")
                                .font(.custom("LibreBaskerville-Italic", size: 24))
                                .padding(.horizontal)
                                .padding(.top)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< 4) { index in
                                        CardView(image: Image("furniture_\(index + 1)"),
                                                 size: 180)
                                    }
                                    .padding(.trailing)
                                }
                                .padding(.leading)
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Search Items")
            .font(.custom("LibreBaskerville-Bold", size: 30))
            .foregroundColor(Color.black)
    }
}

struct SearchBar: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.horizontal)
        }
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color.black: Color.black.opacity(0.5))
            
            if (isActive) {
                Color.black
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct CardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack {
            
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Canadian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$800")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}
