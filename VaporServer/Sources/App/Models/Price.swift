//
//  File.swift
//  
//
//  Created by Лолита on 04.03.2021.
//

import Vapor

struct Price: Content {
    let amount: Int
    let currency: String
}
