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
    
    @State private var actualPassword: String = ""
    @State private var originalActualPassword: String = ""
    @State private var hasChangesActualPassword: Bool = false
    
    @State private var newPassword: String = ""
    @State private var originalNewPassword: String = ""
    @State private var hasChangesNewPassword: Bool = false
    
    @State private var verifyPassword: String = ""
    @State private var originalVerifyPassword: String = ""
    @State private var hasChangesVerifyPassword: Bool = false
    
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                HStack(alignment: .center) {
                    Text("Actual Password: ")
                    Spacer(minLength: 50)
                    SecureField("Actual Password", text: $actualPassword)
                        .keyboardType(.namePhonePad)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .onAppear {
                            // When the view is displayed, we save the original text
                            originalActualPassword = actualPassword
                        }
                        .onChange(of: actualPassword) { newValue in
                            // When the text changes, we compare with the original text
                            hasChangesActualPassword = newValue != originalActualPassword
                        }
                }
                HStack(alignment: .center) {
                    Text("New Password: ")
                    Spacer(minLength: 50)
                    SecureField("Enter Password", text: $newPassword)
                        .keyboardType(.namePhonePad)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .onAppear {
                            // When the view is displayed, we save the original text
                            originalNewPassword = newPassword
                        }
                        .onChange(of: newPassword) { newValue in
                            // When the text changes, we compare with the original text
                            hasChangesNewPassword = newValue != originalNewPassword
                        }
                }
                HStack(alignment: .center) {
                    Text("Verify Password: ")
                    Spacer(minLength: 50)
                    SecureField("Re-enter Password", text: $verifyPassword)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .onAppear {
                            // When the view is displayed, we save the original text
                            originalVerifyPassword = verifyPassword
                        }
                        .onChange(of: verifyPassword) { newValue in
                            // When the text changes, we compare with the original text
                            hasChangesVerifyPassword = newValue != originalVerifyPassword
                        }
                }
            }
            .navigationBarTitle(Text("Change Password"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    // Cancel button action
                    print("Cancel")
                },
                trailing: Button("Done") {
                    // Done button action
                    print("Done")
                    
                    if (newPassword == verifyPassword) {
                        print("Fantastic")
                    } else {
                        showingAlert = true
                    }
                }.disabled(!hasChanges())
            )
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text("Passwords do not match. Please try again."), dismissButton: .default(Text("OK")))
        }
    }
    
    func hasChanges() -> Bool {
        return hasChangesNewPassword || hasChangesVerifyPassword
                || hasChangesActualPassword
        // We add any additional state variables that are needed
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
