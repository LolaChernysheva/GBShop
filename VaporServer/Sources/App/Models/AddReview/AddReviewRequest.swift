//
//  AddReviewRequest.swift
//  
//
//  Created by Лолита on 02.03.2021.
//

import Vapor

struct AddReviewRequest: Content {
    var id_user: Int
    var text: String
}
