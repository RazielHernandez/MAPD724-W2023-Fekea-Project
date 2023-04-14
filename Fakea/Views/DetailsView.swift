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
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 190/255, green: 188/255, blue:196/255)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    Image("chair_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    DescriptionView()
                        .offset(y: -40)
                }
                .edgesIgnoringSafeArea(.top)
                .padding(.bottom)
                
                HStack {
                    Text("$800")
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
            /*.navigationBarItems(leading:
                                    CustomBackButtonView(action:
                                                            {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))*/
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
        DetailsView()
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Canadian \nChair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack (spacing: 4) {
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("Canadian Chair is a modern chair based in an ecentric and new design. Versatile and well suited for everyone.")
                .lineSpacing(8.0)
                .opacity(0.6)
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 16)
                    Text("Height: 115 cm")
                        .opacity(0.6)
                    Text("Wide: 70 cm")
                        .opacity(0.6)
                    Text("Diameter: 68 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack (alignment: .leading) {
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 16)
                    Text("Sooled Wood, Contemporary, \nModern Craft")
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
                        ColorFinalView(color: .white)
                        ColorFinalView(color: .black)
                        ColorFinalView(color: .gray)
                    }
                }
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Quantity")
                        .fontWeight(.semibold)
                    
                    HStack {
                        Button(action:{}) {
                            Image(systemName: "minus")
                                .padding(.all,8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action:{}) {
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
