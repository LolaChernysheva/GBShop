//
//  AddReviewResponse.swift
//  
//
//  Created by Лолита on 02.03.2021.
//

import Vapor

struct AddReviewResponse: Content {
    var result: Int
    var userMessage: String
}
