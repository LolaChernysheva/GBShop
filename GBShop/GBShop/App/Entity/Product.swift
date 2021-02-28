//
//  Product.swift
//  GBShop
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation

struct Product: Codable {
    let idProduct: Int
    let productName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price = "price"
    }
    
}
