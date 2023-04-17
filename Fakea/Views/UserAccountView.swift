//
//  UserAccountView.swift
//  User Account
//
//  Created by Carlos Norambuena on 2023-04-15.
//
import SwiftUI


struct UserAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var firstName: String = "Carlos" //Only has data to display information
    @State private var originalFirstName: String = ""
    @State private var hasChangesFirstName: Bool = false
    
    @State private var lastName: String = "Noram" //Only has data to display information
    @State private var originalLastName: String = ""
    @State private var hasChangesLastName: Bool = false
    
    @State private var address: String = "17 Lawford" //Only has data to display information
    @State private var originalAddress: String = ""
    @State private var hasChangesAddress: Bool = false
    
    @State private var phone: String = "+1 (123) 456 7890" //Only has data to display information
    @State private var originalPhone: String = ""
    @State private var hasChangesPhone: Bool = false
    
    @State private var email: String = "carlos@gmail.com" //Only has data to display information
    @State private var originalEmail: String = ""
    @State private var hasChangesEmail: Bool = false
    
    
    var body: some View {
        //NavigationStack {
            Form {
                ZStack(alignment: .center) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 2.0))
                }.padding(.leading, 110)
                
                Section(header: Text("Basic Information")) {
                    HStack(alignment: .center) {
                        Text("First Name: ")
                        Spacer(minLength: 100)
                        TextField("First Name", text: $firstName)
                            .keyboardType(.namePhonePad)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .onAppear {
                                // When the view is displayed, we save the original text
                                originalFirstName = firstName
                            }
                            .onChange(of: firstName) { newValue in
                                // When the text changes, we compare with the original text
                                hasChangesFirstName = newValue != originalFirstName
                            }
                    }
                    HStack(alignment: .center) {
                        Text("Last Name: ")
                        Spacer(minLength: 100)
                        TextField("Last Name", text: $lastName)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .onAppear {
                                // When the view is displayed, we save the original text
                                originalLastName = lastName
                            }
                            .onChange(of: lastName) { newValue in
                                // When the text changes, we compare with the original text
                                hasChangesLastName = newValue != originalLastName
                            }
                    }
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
                    }
                    HStack(alignment: .center) {
                        Text("Phone: ")
                        Spacer(minLength: 100)
                        TextField("Phone", text: $phone)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .onAppear {
                                // When the view is displayed, we save the original text
                                originalPhone = phone
                            }
                            .onChange(of: phone) { newValue in
                                // When the text changes, we compare with the original text
                                hasChangesPhone = newValue != originalPhone
                            }
                    }
                    HStack(alignment: .center) {
                        Text("Email: ")
                        Spacer(minLength: 100)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .onAppear {
                                // When the view is displayed, we save the original text
                                originalEmail = email
                            }
                            .onChange(of: email) { newValue in
                                // When the text changes, we compare with the original text
                                hasChangesEmail = newValue != originalEmail
                            }
                    }
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("User Account"))
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGroupedBackground))
            .navigationBarItems(
                leading: Button("Cancel") {
                    // Cancel button action
                    print("Cancel")
                },
                trailing: Button("Done") {
                    // Done button action
                    print("Done")
                }.disabled(!hasChanges())
            )
        //}
    }
    
    func hasChanges() -> Bool {
        return hasChangesFirstName || hasChangesLastName
        || hasChangesAddress || hasChangesPhone || hasChangesEmail
        // We add any additional state variables that are needed
    }
    
}

struct UserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountView()
    }
}
