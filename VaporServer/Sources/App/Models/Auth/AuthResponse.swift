//
//  AuthResponse.swift
//  
//
//  Created by Лолита on 28.02.2021.
//

import Vapor

struct AuthResponse: Content {
    var result: Int
    var user: User
}
