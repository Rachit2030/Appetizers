//
//  AccountsViewModel.swift
//  Appetizers
//
//  Created by Rachit on 05/05/24.
//

import SwiftUI

class AccountsViewModel: ObservableObject{
    @Published var user = User()
    
    @Published var alertItem: AlertItem?
    
    @AppStorage("user") private var userData: Data?
    
    var isVaildForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            self.alertItem = AlertContext.invalidForm
            return false
        }
        
        
        return true
    }
    
    func saveChanges(){
        guard isVaildForm else {return}
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }catch{
            alertItem = AlertContext.userSaveError
        }
        
        print("Changes have been saved: \(user)")
    }
    
    func retrieveUser(){
        guard let userData = userData else {return}
        
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
            
        }catch{
            alertItem = AlertContext.userSaveError
        }
        
        
    }
}
