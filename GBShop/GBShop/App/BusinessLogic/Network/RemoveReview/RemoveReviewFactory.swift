//
//  RemoveReviewFactory.swift
//  GBShop
//
//  Created by Лолита on 01.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

protocol RemoveReviewFactory {
    func removeReview(
        idComment: Int,
        completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void
    )
}
