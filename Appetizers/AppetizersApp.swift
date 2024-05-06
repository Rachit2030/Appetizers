//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Rachit on 04/05/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
   var orders: Order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(orders)
        }
    }
}
