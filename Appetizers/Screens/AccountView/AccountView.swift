//
//  AccountView.swift
//  Appetizers
//
//  Created by Rachit on 04/05/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewmodel: AccountsViewModel = AccountsViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField{
        case firstName,lastName,email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(content: {
                    TextField("First Name", text: $viewmodel.user.firstName)
                        .focused($focusedTextField,equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewmodel.user.lastName)
                        .focused($focusedTextField,equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    TextField("Email", text: $viewmodel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                        .focused($focusedTextField,equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                    
                    DatePicker("Birthday", selection: $viewmodel.user.birthday, displayedComponents: .date)
                        .tint(Color.brandPrimary)
                    
                    Button{
                        viewmodel.saveChanges()
                    }label: {
                        Text("Save Changes")
                            .fontWeight(.medium)
                            .foregroundStyle(Color.brandPrimary)
                    }
                    
                }, header: {
                    Text("Personal Info")
                }
                )
                Section(content: {
                    Toggle("Extra Napkins", isOn: $viewmodel.user.extraNapkins)
                      //  .tint(Color.brandPrimary)
                    Toggle("Frequent Refils", isOn: $viewmodel.user.frequentRefils)
                     //   .tint(Color.brandPrimary)
                }, header: {
                   
                    Text("Requests")
                }).tint(Color.brandPrimary)
               
                
            }.navigationTitle("Account🧍🏻")
                .toolbar{
                    ToolbarItem(placement: .keyboard) {
                        Button{
                            focusedTextField = nil
                        }label: {
                            Text("Dismiss")
                        }
                    }
                }
            
            
        }
        .onAppear{
            viewmodel.retrieveUser()
        }
        .alert(item: $viewmodel.alertItem){ alertItem in
            Alert(title: alertItem.title,message: alertItem.message,dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
