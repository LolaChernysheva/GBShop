//
//  GetProduct.swift
//  GBShop
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

class GetProduct: AbstractRequestFactory {
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

extension GetProduct: GetProductRequestFactory {
    func getProduct (
        idProduct: Int,
        completionHandler: @escaping (AFDataResponse<GetProductResult>) -> Void
    ) {
        let requestModel = GetProductRequest(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetProduct {
    struct GetProductRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getProduct"
        let idProduct: Int
        var parameters: Parameters? {
            [
                "id_product": idProduct
            ]
        }
    }
}
