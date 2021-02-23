//
//  GetProductResult.swift
//  GBShop
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation

struct GetProductResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription =  "product_description"
    }
}
