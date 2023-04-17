//
//  CreditCard.swift
//  Fakea
//
//  Created by Raziel Hernandez on 2023-04-16.
//

import SwiftUI

struct CreditCard<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        VStack {
            content()
        }
    }
}

struct CreditCardFront: View {
    
    let name: String
    let expiration: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top ) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)
                Spacer()
                Text("VISA/MC")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }
            Spacer()
            Text("**** **** **** 3117")
                .foregroundColor(.white)
                .font(.system(size: 24))
            Spacer()
            HStack {
                VStack {
                    Text("CARD HOLDER")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .font(.caption)
                    Text(name)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.caption)
                    
                }
                Spacer()
                VStack {
                    Text("EXPIRES")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .font(.caption)
                    Text(expiration)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.caption)
                    
                }
            }
        }.frame(width: 300, height: 200)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
        
    }
}

struct CreditCardBack: View {
    let cvv: String

    var body: some View {
        VStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 20)
                .padding(.top)
                .foregroundColor(.black)
            Spacer()
            HStack {
                Text(cvv)
                    .foregroundColor(Color.black)
                    .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding(5.0)
                    .frame(width: 100.0, height: 20)
                
                Spacer()
            }.padding()
        }
        .frame(width: 300, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [.orange, .blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
        
    }
}
