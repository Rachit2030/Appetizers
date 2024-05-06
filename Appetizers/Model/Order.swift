//
//  Order.swift
//  Appetizers
//
//  Created by Rachit on 05/05/24.
//

import Foundation


final class Order: ObservableObject{
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    var getTotal: Double{
        var total = 0.0
        for item in items{
            total += item.price
        }
        return total
    }
}
