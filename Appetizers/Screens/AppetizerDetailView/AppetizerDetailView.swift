//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Rachit on 05/05/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    var appetizer: Appetizer
    @Binding var isShowingDetailView : Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity,height: 240)
                
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.gray)
                    .lineLimit(3)
                    .padding()
                    
            }
            .padding(.top,8)
            Spacer()
            HStack{
            Spacer()
            VStack{
                Text("Calories")
                    .font(.caption)
                Text("\(appetizer.calories)")
                    .fontWeight(.medium)
                    .font(.title3)
                    .foregroundStyle(Color.secondary)
                    .italic()
            }
            Spacer()
            VStack{
                Text("Carbs")
                    .font(.caption)
                Text("\(appetizer.carbs)")
                    .fontWeight(.medium)
                    .font(.title3)
                    .foregroundStyle(Color.secondary)
                    .italic()
            }
            Spacer()
            VStack{
                Text("Protein")
                    .font(.caption)
                Text("\(appetizer.protein)")
                    .fontWeight(.medium)
                    .font(.title3)
                    .foregroundStyle(Color.secondary)
                    .italic()
            }
            Spacer()
        }
            Spacer()
            
            Button{
                order.add(appetizer)
                isShowingDetailView = false
            }label: {
                Text("$ \(appetizer.price,specifier: "%.1f") - Add To Order")
                   // .frame(width: 240)
                   // .padding(.horizontal, 60)
                    // .padding()
                  //  .background(Color.brandPrimary)
                    //.foregroundStyle(Color.white)
                    .font(.title3)
                    .fontWeight(.medium)
                   // .clipShape(RoundedRectangle(cornerRadius: 12))
                    
            }
            .modifier(StandardButtonStyle())
//            .buttonStyle(.bordered)
//            .tint(.brandPrimary)
//            .controlSize(.large)
//            .padding()
            
        }.frame(width: 320,height: 525)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 40)
            .overlay(DismissButton(isShowingDetailView: $isShowingDetailView),alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer,isShowingDetailView: .constant(true))
}


struct DismissButton: View {
    @Binding var isShowingDetailView: Bool
//    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button{
           // presentationMode.wrappedValue.dismiss()
            isShowingDetailView = false
        }label: {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 14,height: 14)
                .padding(.all,8)
                .background(.white)
                .opacity(0.8)
                .clipShape(Circle())
                .padding()
                .foregroundStyle(Color.black)
                .shadow(radius: 10)
                
        }
        
    }
}
