//
//  EmptyState.swift
//  Appetizers
//
//  Created by Rachit on 05/05/24.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack{
             
                Image("empty-order")
                    .resizable()
                    .frame(width: 200,height: 150)
                    .aspectRatio(contentMode: .fit)
                
                Text("No Items To Show.\n Please Add an Appetizer!")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.secondary)
                    .padding()
                //Spacer()
            }.offset(y: -100)
            
            
        }
    }
}

#Preview {
    EmptyState()
}
