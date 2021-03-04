//
//  AddToBasketRequest.swift
//  
//
//  Created by Лолита on 04.03.2021.
//

import Vapor

struct AddToBasketRequest: Content {
    var id_product: Int
    var quantity: Int
}
