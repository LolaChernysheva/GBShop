//
//  RegisterResponse.swift
//  
//
//  Created by Лолита on 28.02.2021.
//

import Vapor

struct RegisterResponse: Content {
    var result: Int
    var userMessage: String?
    var error_message: String?
}
