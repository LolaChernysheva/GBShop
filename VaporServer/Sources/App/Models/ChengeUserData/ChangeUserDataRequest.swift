//
//  ChangeUserDataRequest.swift
//
//  Created by Лолита on 28.02.2021.
//

import Vapor

struct ChangeUserDataRequest: Content {
    
    var id_user: String
    var username: String
    var password: String
    var email: String
    var gender: String
    var credit_card: String
    var bio: String
}
