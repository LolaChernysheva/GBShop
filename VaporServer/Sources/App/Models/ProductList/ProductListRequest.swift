//
//  File.swift
//  
//
//  Created by Лолита on 28.02.2021.
//

import Vapor

struct ProductListRequest: Content {
    
    var page_number: String
    var id_category: String
}
