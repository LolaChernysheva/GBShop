//
//  GetReviewsListRequestFactory.swift
//  GBShop
//
//  Created by Лолита on 02.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

protocol GetReviewsListRequestFactory {
    func getReviewsList(
        pageNumber: Int,
        completionHandler: @escaping (AFDataResponse<[Reviews]>) -> Void
    )
}
