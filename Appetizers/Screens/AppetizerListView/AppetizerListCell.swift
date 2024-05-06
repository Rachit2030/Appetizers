//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Rachit on 04/05/24.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizer
    var body: some View {
        HStack {
            //            AppetizerRemoteImage(urlString: appetizer.imageURL)
            //        //.resizable()
            //               .frame(width: 120,height: 90)
            //                .aspectRatio(contentMode: .fit)
            //               .clipShape(RoundedRectangle(cornerRadius: 10))
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .frame(width: 120,height: 90)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
            } placeholder: {
                Image("food-placeholder").resizable()
                    .frame(width: 120,height: 90)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            
            VStack(alignment: .leading) {
                Text("\(appetizer.name)")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.bottom,4)
                
                Text("$ \(appetizer.price,specifier: "%.2f")")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.gray)
                
            } .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
