//
//  File.swift
//  
//
//  Created by Лолита on 04.03.2021.
//

import Vapor
struct PayBasketResponse: Content {
    var id: Int
    var price: Price
}
