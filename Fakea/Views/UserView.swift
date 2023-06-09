//
//  UserView.swift
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
// Show user settings

import SwiftUI

struct UserView: View {
    @State private var showNotification = false
    @ObservedObject var dataBase: FirestoreManager
    
    func loggingFunction(email: String, password: String) {
        print("Loggin with \(email)/\(password)")
        dataBase.loginUser(login: email, password: password)
    }
    
    func logoutFunction() {
        dataBase.logoutUser()
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 190/255, green: 188/255, blue:196/255)
                    .edgesIgnoringSafeArea(.all)
                
                if (dataBase.user.enable) {
                    LoggedView(logoutFunction: logoutFunction, dataBase: dataBase)
                } else {
                    UserLoginView(loggingAction: loggingFunction(email:password:))
                }
                
            }
        }
    }
    
}

struct FormHiddenBackground: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content.scrollContentBackground(.hidden)
        } else {
            content.onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
            .onDisappear {
                UITableView.appearance().backgroundColor = .systemGroupedBackground
            }
        }
    }
}

struct LoggedView: View {
    var logoutFunction: () -> Void
    @ObservedObject var dataBase: FirestoreManager
    
    func testFunction() {
        print("Test function")
    }
    
    var body: some View {
        VStack {
            Form {
                VStack (alignment: .center) {
                    Text ("User account")
                        .font(.largeTitle)
                    Image (systemName: "person.fill")
                        .resizable()
                        .frame(width: 72, height: 72)
                }
                .frame(maxWidth: .infinity)
                
                
                Section(header: Text("User account")) {
                    NavigationLink(destination: UserAccountView(dataBase: dataBase)) {
                        SettingRowView(title: "User info", systemImageName: "person.fill", action: testFunction)
                    }
                    NavigationLink(destination: ChangePasswordView(dataBase: dataBase)) {
                        SettingRowView(title: "Change password", systemImageName: "key.fill", action: testFunction)
                    }
                    NavigationLink(destination: AddressView(dataBase: dataBase)) {
                        SettingRowView(title: "Address", systemImageName: "location.fill", action: testFunction)
                    }
                    NavigationLink(destination: CreditCardStruct(dataBase: dataBase)) {
                        SettingRowView(title: "Methods of payment", systemImageName: "creditcard.fill", action: testFunction)
                    }
                }
                
                Section(header: Text("Orders")) {
                    NavigationLink(destination: NotificationView()) {
                        SettingRowView(title: "Notification", systemImageName: "bell.fill", action: testFunction)
                    }
                    SettingRowView(title: "My orders", systemImageName: "gift.fill", action: testFunction)
                }
                
                Section(header: Text("Others")) {
                    SettingRowView(title: "About us", systemImageName: "person.fill.questionmark", action: testFunction)
                    SettingRowView(title: "Help", systemImageName: "questionmark.bubble.fill", action: testFunction)
                    Button("Logout"){
                        logoutFunction()
                    }
                    .buttonStyle(.borderedProminent)
                    .accentColor(Color(red: 50/255, green: 50/255, blue:50/255))
                    .foregroundColor(Color.white)
                }
                
                
            }
            .padding(.bottom)
            .modifier(FormHiddenBackground())
            .foregroundColor(Color.black)
            
            
        }
        
    }
}

struct SettingRowView : View {
    var title : String
    var systemImageName : String
    var action: () -> Void
    
    var body : some View {
        HStack (spacing : 15) {
            Image(systemName: systemImageName)
            if (title == "Notification") {
                Text (title).badge(5)
            }
            else if (title == "User name") {
                Text (title)
                Button("Edit") {
                    self.action()
                }
            }
            else {
                Text (title)
            }
        }
    }
}



struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var dataBase = FirestoreManager()
        UserView(dataBase: dataBase)
    }
}
