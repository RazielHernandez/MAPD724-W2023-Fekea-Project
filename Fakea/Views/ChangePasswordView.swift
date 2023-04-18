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

struct ChangePasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dataBase: FirestoreManager
    
    @State private var actualPassword: String = ""
    @State private var newPassword: String = ""
    @State private var verifyPassword: String = ""
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                HStack(alignment: .center) {
                    Text("Actual Password: ")
                    SecureField("Actual Password", text: $actualPassword)
                        .keyboardType(.namePhonePad)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                HStack(alignment: .center) {
                    Text("New Password: ")
                    SecureField("Enter Password", text: $newPassword)
                        .keyboardType(.namePhonePad)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                HStack(alignment: .center) {
                    Text("Verify Password: ")
                    SecureField("Re-enter Password", text: $verifyPassword)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
            }
            .navigationBarTitle(Text("Change Password"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button("Save") {
                    
                    if (newPassword == verifyPassword && actualPassword == dataBase.user.password) {
                        dataBase.user.password = newPassword
                        dataBase.updateUser(userToUpdate: dataBase.user)
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        showingAlert = true
                    }
                }
                .alert("The data doesn't match", isPresented: $showingAlert) {
                    Button("Got it!", role: .cancel) { }
                }
            )
        }
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var dataBase = FirestoreManager()
        ChangePasswordView(dataBase: dataBase)
    }
}
