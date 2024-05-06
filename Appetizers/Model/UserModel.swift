//
//  UserModel.swift
//  Appetizers
//
//  Created by Rachit on 05/05/24.
//

import Foundation

struct User: Codable{
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthday: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefils: Bool = false
}
