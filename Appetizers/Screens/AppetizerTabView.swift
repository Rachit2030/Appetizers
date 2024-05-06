//
//  ContentView.swift
//  Appetizers
//
//  Created by Rachit on 04/05/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order : Order
    var body: some View {
        TabView {
            
            AppetizerListview()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
               
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }

            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                       
                } .badge(order.items.count)
                
        }.tint(.brandPrimary)
    }
    
    }

#Preview {
    AppetizerTabView().environmentObject(Order())
}
