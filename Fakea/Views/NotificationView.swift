//
//  NotificationView.swift
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
// View to show user notifications.

import SwiftUI

struct NotificationView: View {
    
    var notificationData = [
        Notification(message: "Congratulations! You've created an account", date: "01/01/2023", color: Color.white),
        Notification(message: "A credit card was succesfully added", date: "01/02/2023", color: Color.white),
        Notification(message: "Your order was placed", date: "01/03/2023", color: Color.blue),
        Notification(message: "Your new forniture is ready to be delivered", date: "01/04/2023", color: Color.blue),
        Notification(message: "Your package was delivered today", date: "01/05/2023", color: Color.blue)
    ]
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Notifications")
                Spacer()
                Image(systemName: "bell.fill")
                    .foregroundColor(.gray)
                    
            }
            .font(.system(size: 36))
            
            ForEach(notificationData, id: \.self) { not in
                //HStack {
                    
                Label {
                    VStack {
                        Text(not.message)
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(not.date)
                            .font(.system(size: 12))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(5)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                } icon: {
                    Image(systemName: "bell.fill")
                        .padding()
                        .foregroundColor(not.color)
                        .font(.system(size: 30))
                }
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.black, lineWidth: 2)
                )
                
            }
            
            
            Spacer()
        }
        .padding()
        .background(Color(red: 190/255, green: 188/255, blue:196/255))
    }
}

struct Notification: Identifiable,Hashable {
    var id = UUID()
    var message: String
    var date: String
    var color: Color
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
