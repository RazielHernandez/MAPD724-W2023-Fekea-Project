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


struct UserAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dataBase: FirestoreManager
    
    
    var body: some View {
        Form {
            ZStack(alignment: .center) {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }.padding(.leading, 110)
            
            Section(header: Text("Basic Information")) {
                HStack(alignment: .center) {
                    Text("First Name: ")
                    TextField("First Name", text: $dataBase.user.name)
                        .keyboardType(.namePhonePad)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                HStack(alignment: .center) {
                    Text("Last Name: ")
                    TextField("Last Name", text: $dataBase.user.lastName)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        
                }
                /*
                HStack(alignment: .center) {
                    Text("Address: ")
                    Spacer(minLength: 100)
                    TextField("Address", text: $address)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .onAppear {
                            // When the view is displayed, we save the original text
                            originalAddress = address
                        }
                        .onChange(of: address) { newValue in
                            // When the text changes, we compare with the original text
                            hasChangesAddress = newValue != originalAddress
                        }
                }*/
                HStack(alignment: .center) {
                    Text("Phone: ")
                    Spacer(minLength: 50)
                    TextField("Phone", text: $dataBase.user.telephone)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                HStack(alignment: .center) {
                    Text("Email: ")
                    Spacer(minLength: 50)
                    TextField("Email", text: $dataBase.user.email)
                        .keyboardType(.emailAddress)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .disabled(true)
                        
                }
            }
            
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(Text("User Account"))
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
        .navigationBarItems(
            trailing: Button("Save") {
                dataBase.updateUser(userToUpdate: dataBase.user)
                self.presentationMode.wrappedValue.dismiss()
            }
        )
    }
    
}

struct UserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var dataBase = FirestoreManager()
        UserAccountView(dataBase: dataBase)
    }
}
