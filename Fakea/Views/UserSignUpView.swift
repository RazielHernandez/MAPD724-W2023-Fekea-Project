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

struct UserSignUpView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirm: String = ""
    @ObservedObject private var dataBase = FirestoreManager()
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack {
            Color(red: 190/255, green: 188/255, blue:196/255)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                VStack (alignment: .center) {
                    Text ("User account")
                        .font(.largeTitle)
                    Image (systemName: "person.fill")
                        .resizable()
                        .frame(width: 72, height: 72)
                }
                .frame(maxWidth: .infinity)
                
                HStack {
                    Text("User email")
                    TextField(
                        "User name (email address)",
                        text: $username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .border(Color(UIColor.separator))
                }
                
                HStack {
                    Text("Create a Password")
                    SecureField(
                        "Password",
                        text: $password
                    )
                    .border(Color(UIColor.separator))
                }
                
                HStack {
                    Text("Confirm Password")
                    SecureField(
                        "Password",
                        text: $confirm
                    )
                    .border(Color(UIColor.separator))
                }
                
                
                Button ("Create account") {
                    if (!username.isEmpty && !password.isEmpty && !confirm.isEmpty && password == confirm){
                        dataBase.insertUser(newUser: UserModel(email: username,  enable: true, password: password))
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    
                }
                .buttonStyle(.borderedProminent)
                    
                
                
            }
        }
    }
}

struct UserSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        UserSignUpView()
    }
}
