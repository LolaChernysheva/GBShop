//
//  GetProductResponse.swift
//  
//
//  Created by Лолита on 28.02.2021.
//

import Vapor

struct GetProductResponse: Content {
    
    var result: Int
    var product_name: String
    var product_price: Int
    var product_description: String
    
}
