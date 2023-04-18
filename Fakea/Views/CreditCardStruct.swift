//
//  HomeItems.swift
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

import SwiftUI

struct CreditCardStruct: View {
    @State private var degress: Double = 0
    @State private var isFlipped: Bool  = false
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dataBase: FirestoreManager
    @State var card: CreditCardModel = CreditCardModel()
    
    //@State private var name: String  = ""
    //@State private var date: String  = ""
    //@State private var cvv: String  = ""
    
    var body: some View {
        VStack {
          
            Text("ADD CREDIT CARD")
                .font(.title)
                .fontWeight(.bold)
            
            CreditCard {
                VStack {
                    Group {
                        if self.isFlipped {
                            CreditCardBack(cvv: card.cvv)
                        } else {
                            CreditCardFront(name: card.name, expiration: card.expireDate)
                        }
                    }
                }.rotation3DEffect(.degrees(self.degress), axis: (x: 0, y: 1.0, z: 0))
            }.onTapGesture {
                withAnimation {
                    self.degress += 180
                    self.isFlipped.toggle()
                }
            }
            TextField("Name", text: $card.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            TextField("Number", text: $card.number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            TextField("Expiry Date", text: $card.expireDate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            TextField("CVV", text: $card.cvv, onEditingChanged: {(editingChanged) in
                withAnimation {
                    self.degress += 180
                    self.isFlipped.toggle()
                }
            } )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            
        }
        .navigationBarTitle(Text("Address"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing: Button("Save") {
                saveCard()
            }
        )
        .onAppear() {
            if (dataBase.user.creditCards.count > 0) {
                self.card = dataBase.user.creditCards[0]
            } else {
                dataBase.user.creditCards.append(self.card)
            }
        }
    }
    
    func saveCard() {
        dataBase.user.creditCards[0] = card
        dataBase.updateUser(userToUpdate: dataBase.user)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct CreditCardStruct_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var dataBase = FirestoreManager()
        CreditCardStruct(dataBase: dataBase)
    }
}
