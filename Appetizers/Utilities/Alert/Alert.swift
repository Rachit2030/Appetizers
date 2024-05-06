//
//  Alert.swift
//  Appetizers
//
//  Created by Rachit on 05/05/24.
//

import SwiftUI


struct AlertItem: Identifiable {
    
    let id = UUID()
    let title: Text
    let message : Text
    let dismissButton: Alert.Button
    
}

struct AlertContext {
    //MARK: Network Alerts
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("Data received From server is invalid. Please contact support"), dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Invalid Response"), message: Text("Data received From server is invalid. Please contact support"), dismissButton: .default(Text("OK")))
    static let invalidData = AlertItem(title: Text("Invalid Data"), message: Text("Data received From server is invalid. Please contact support"), dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Unable To Complete The Request"), message: Text("Data received From server is invalid. Please contact support"), dismissButton: .default(Text("OK")))
    
    //MARK: Acount Alerts
    
    static let invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please Fill the Details Correctly!"), dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"), message: Text("Your Profile information was successfully saved"), dismissButton: .default(Text("OK")))
    
    static let userSaveError = AlertItem(title: Text("Unable to Save Profile"), message: Text("Your Profile could not be saved. Please Try again later!!"), dismissButton: .default(Text("OK")))

}
