//
//  Reviews.swift
//  GBShop
//
//  Created by Лолита on 02.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation

struct Reviews: Codable {
    let idComment: Int
    let text: String

    enum CodingKeys: String, CodingKey {
        case idComment = "id_comment"
        case text = "text"
    }
}
