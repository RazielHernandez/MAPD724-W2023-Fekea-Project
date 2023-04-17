//
//  AddressView.swift
//  FurnitureAppPart1
//
//  Created by ying zhang on 2023-04-16.
//

import SwiftUI

struct AddressView: View {
    private var listOfCountry = countryList
    @State var searchText = ""
    @State var address = ""
    @State var streetAddress = ""
    @State var city = ""
    @State var zip = ""
    
    var hasValidAddress: Bool {
        if streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }

        return true
    }
    
    var body: some View {
        NavigationView {
           
            Form {
               
                Section {
                    TextField("Address 1", text:$address)
                    TextField("Street address", text: $streetAddress)
                    TextField("City", text:$city)
                    TextField("Zip", text:$zip)
                    TextField("Countries", text: $searchText)
                    
                }
                Section {
                    TextField("Address 2", text:$address)
                    TextField("Street address", text: $streetAddress)
                    TextField("City", text:$city)
                    TextField("Zip", text:$zip)
                    
                }
                
                Section{
                    Button(action: {}) {
                        
                        Text("Save")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                    }
                
                }
                .navigationTitle("Delivery Address")
                .navigationBarTitleDisplayMode(.inline)
                
           
            /*List {
                ForEach(countries, id: \.self) { country in
                    HStack {
                        Text(country.capitalized)
                        Spacer()
                    }
                    .padding()
                }
            }*/


        }
            
        }
    }
    
    // Filter countries
    var countries: [String] {
        // Make countries lowercased
        let lcCountries = listOfCountry.map { $0.lowercased() }
        
        return searchText == "" ? lcCountries : lcCountries.filter { $0.contains(searchText.lowercased()) }
    }
}



struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView()
    }
}
