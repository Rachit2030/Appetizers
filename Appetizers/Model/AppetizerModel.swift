//
//  AppetizerModel.swift
//  Appetizers
//
//  Created by Rachit on 04/05/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable, Hashable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 001, name: "Test ", description: "This is description of the appetitizer testing object you might like it ", price: 99.9, imageURL: "", calories: 12, protein: 1, carbs: 45)
    static let sampleAppetizer2 = Appetizer(id: 002, name: "Test ", description: "This is description of the appetitizer testing object you might like it ", price: 99.9, imageURL: "", calories: 12, protein: 1, carbs: 45)
    static let sampleAppetizer3 = Appetizer(id: 003, name: "Test ", description: "This is description of the appetitizer testing object you might like it ", price: 99.9, imageURL: "", calories: 12, protein: 1, carbs: 45)
    
   static let appetizers = [sampleAppetizer,sampleAppetizer2,sampleAppetizer3]
    
    
}
