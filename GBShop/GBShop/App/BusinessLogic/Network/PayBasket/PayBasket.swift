//
//  PayBasket.swift
//  GBShop
//
//  Created by Лолита on 04.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

class PayBasket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL

    init(
    errorParser: AbstractErrorParser,
    sessionManager: Session,
    queue: DispatchQueue = DispatchQueue.global(qos: .utility),
    baseUrl: URL
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension PayBasket: PayBasketRequestFactory {
    func payBasket(id: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void) {
        let requestModel = PayBasketRequest(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension PayBasket {
    struct PayBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "payBasket"
        let id: Int
        var parameters: Parameters? {
            [
                "id": id
            ]
        }
    }
}
