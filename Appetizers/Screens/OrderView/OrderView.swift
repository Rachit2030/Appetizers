//
//  OrderView.swift
//  Appetizers
//
//  Created by Rachit on 04/05/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var orderItems: Order
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
                List{
                    ForEach(orderItems.items){ appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: { indexSet in
                        orderItems.items.remove(atOffsets: indexSet)
                    })
                    
                }
                
                Button{
                    
                }label: {
                    Text("$ \(orderItems.getTotal,specifier: "%.1f") - Add To Order")
                    //                        .frame(width: 240)
                    //                       // .padding(.horizontal, 60)
                    //                        .padding()
                    //                        .background(Color.brandPrimary)
                    //                        .foregroundStyle(Color.white)
                        .font(.title3)
                        .fontWeight(.medium)
                    //                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    //                        .padding()
                }
                .modifier(StandardButtonStyle())
                
                
                if(orderItems.items.isEmpty){
                    EmptyState()
                }
            }
            .navigationTitle("Orders 💰")
        }
    }
}

#Preview {
    OrderView().environmentObject(Order())
}
