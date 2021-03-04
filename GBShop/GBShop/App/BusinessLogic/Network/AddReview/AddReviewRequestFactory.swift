//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Лолита on 02.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire
protocol AddReviewRequestFactory {
    func addReview(
        idUser: Int,
        text: String,
        completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void
    )
}
