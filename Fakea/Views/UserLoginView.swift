//
//  UserLoginView.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-13.
//

import SwiftUI

struct UserLoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var loggingAction: (String, String) -> Void
    
    var body: some View {
        VStack {
            
            VStack (alignment: .center) {
                Text ("User account")
                    .font(.largeTitle)
                Image (systemName: "person.fill")
                    .resizable()
                    .frame(width: 72, height: 72)
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            
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
                Text("Password")
                SecureField(
                    "Password",
                    text: $password
                ) {
                    loggingAction(username, password)
                }
                .border(Color(UIColor.separator))
            }
            
            
            Button ("Login") {
                loggingAction(username, password)
            }
            .buttonStyle(.borderedProminent)
            
            NavigationLink(destination: UserSignUpView()) {
                Text("Create a new account")
            }
            
            Spacer()
            
        }
    }
}

func testFunction(email: String, password: String) {
    print("Loggin with \(email)/\(password)")
}

struct UserLoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        UserLoginView(loggingAction: testFunction(email: password:))
    }
}
