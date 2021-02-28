//
//  AuthRequest.swift
//  
//
//  Created by Лолита on 28.02.2021.
//

import Vapor

struct AuthRequest: Content {
    var username: String
    var password: String
}
