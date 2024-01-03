//
//  RegisterFormModel.swift
//  Register form
//
//  Created by Admin on 03/01/2024.
//

import Foundation


enum Gender {
    case male
    case female
    case other
}

struct RegisterFormModel {
    var userName: String = ""
    var firstName: String = ""
    var birthYear: Date = Date()
    var gender: Gender = .male
    var district: String = ""
    var phoneNumber: String = ""
    var address: String = ""
}
