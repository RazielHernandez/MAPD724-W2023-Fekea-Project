//
//  DetailsView.swift
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
// Show Item details

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var dataBase: FirestoreManager
    @State private var quantity: Int = 1
    
    var furniture: FurnitureModel
    
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 190/255, green: 188/255, blue:196/255)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    AsyncImage(
                        url: URL(string: furniture.images[0]),
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(width: 400, height: 300)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .cornerRadius(20.0)
                    
                    VStack(alignment: .leading) {
                        Text(furniture.category)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        HStack {
                            HStack {
                                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                                    Image("star")
                                }
                            }
                            Text(String(format: "Rating %.2f", furniture.rating))
                            
                            if (dataBase.user.favorites.contains(furniture.id)) {
                                Image("star")
                            }
                            
                            Spacer()
                            Button("Favorites") {
                                if (!dataBase.user.favorites.contains(furniture.id)){
                                    dataBase.user.favorites.append(furniture.id)
                                    dataBase.updateUser(userToUpdate: dataBase.user)
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .disabled(!dataBase.user.enable)
                        }
                        
                        
                        Text("Description")
                            .fontWeight(.medium)
                            .padding(.vertical, 8)
                        
                        Text(furniture.shortDescription)
                            .lineSpacing(8.0)
                            .opacity(0.6)
                        HStack (alignment: .top) {
                            VStack (alignment: .leading) {
                                Text("Size")
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 16)
                                Text("\(String(format: "D %.2f", furniture.dimensions.depth)) \(furniture.dimensions.unit)")
                                    .opacity(0.6)
                                Text("\(String(format: "W %.2f", furniture.dimensions.width)) \(furniture.dimensions.unit)")
                                    .opacity(0.6)
                                Text("\(String(format: "H %.2f", furniture.dimensions.height)) \(furniture.dimensions.unit)")
                                    .opacity(0.6)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack (alignment: .leading) {
                                Text("Treatment")
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 16)
                                Text("\(furniture.material) \n\(furniture.style)")
                                    .opacity(0.6)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical)
                        
                        HStack (alignment: .bottom) {
                            VStack (alignment: .leading) {
                                Text("Colors")
                                    .fontWeight(.semibold)
                                
                                HStack {
                                    ForEach(furniture.colors, id: \.self) { color in
                                        ColorFinalView(color: color.getColor())
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .leading) {
                                Text("Quantity")
                                    .fontWeight(.semibold)
                                
                                HStack {
                                    Button(action:{
                                        if (self.quantity > 1){
                                            self.quantity -= 1
                                        }
                                    }) {
                                        Image(systemName: "minus")
                                            .padding(.all,8)
                                    }
                                    .frame(width: 30, height: 30)
                                    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                                    .foregroundColor(.black)
                                    
                                    Text(String(quantity))
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 8)
                                    
                                    Button(action:{
                                        if (self.quantity < 10){
                                            self.quantity += 1
                                        }
                                    }) {
                                        Image(systemName: "plus")
                                            .padding(.all,8)
                                    }
                                    .background(Color.gray)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                                }
                            }
                        }
                        VStack (alignment: .leading) {
                            NavigationLink(destination: Map()){
                                Label("Find in our shops", systemImage: "mappin.and.ellipse")
                            }.background(Color.blue)
                                .foregroundColor(Color.white)
                                .padding(.bottom)
                                .frame(height: 30)
                            
                            NavigationLink(destination: ARView()){
                                Label("View 3D", systemImage: "rotate.3d")
                            }.background(Color.blue)
                                .foregroundColor(Color.white)
                                .padding(.bottom)
                                .frame(height: 30)
                        }
                    }
                    .padding()
                    .padding(.top)
                    .background(Color(red: 190/255, green: 188/255, blue:196/255))
                    .cornerRadius(0.0)
                    .offset(x: 0, y: -30.0)
                }
                .edgesIgnoringSafeArea(.top)
                .padding(.bottom)
                
                HStack {
                    Text(String(format: "$ %.2f", furniture.price))
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Add to Cart")
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10.0)
                            .foregroundColor(Color.gray)
                    })
                }
                .padding(.horizontal)
                .background(Color.gray)
                .cornerRadius(50, corners: .topLeft)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .padding(.bottom)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        let testFurniture = FurnitureModel(brand: "Test", dimensions: FurnitureDimension())
        @ObservedObject var dataBase = FirestoreManager()
        DetailsView(dataBase: dataBase, furniture: testFurniture)
    }
}

struct ColorFinalView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct CustomBackButtonView: View {
    let action: ()-> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
                .foregroundColor(.black)
        })
    }
}
