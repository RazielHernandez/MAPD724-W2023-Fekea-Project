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

struct AddressView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dataBase: FirestoreManager
    @State var address: AddressModel = AddressModel()
    
    var body: some View {
        
        Form {
            Section (header: Text("Delivery address")) {
                TextField("Name", text:$address.name)
                TextField("Address", text:$address.address)
                TextField("Zip", text:$address.postalCode)
                TextField("Telephone", text:$address.telephone)
            }
            
            Section{
                Button(action: {saveAddress()}) {
                    Text("Save")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                }
            }
        }
        .navigationBarTitle(Text("Address"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing: Button("Save") {
                saveAddress()
            }
        )
        .onAppear() {
            if (dataBase.user.addresses.count > 0) {
                self.address = dataBase.user.addresses[0]
            } else {
                dataBase.user.addresses.append(self.address)
            }
        }
        
    }
    
    func saveAddress() {
        dataBase.user.addresses[0] = address
        dataBase.updateUser(userToUpdate: dataBase.user)
        self.presentationMode.wrappedValue.dismiss()
    }
}



struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var dataBase = FirestoreManager()
        AddressView(dataBase: dataBase, address: AddressModel())
    }
}
