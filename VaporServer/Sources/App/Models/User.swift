//
//  File.swift
//  
//
//  Created by Лолита on 28.02.2021.
//

import Vapor

struct User: Content {
    let id_user: Int
    let user_login: String
    let user_name: String
    let user_lastname: String
}
