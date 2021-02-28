//
//  ProductList.swift
//  GBShop
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

class ProductList: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
    
    init(
    errorParser: AbstractErrorParser,
    sessionManager: Session,
    queue: DispatchQueue = DispatchQueue.global(qos: .utility),
    baseUrl: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension ProductList: ProductListRequestFactory {
    
    func productList(pageNumber: String,
                     idCategory: String,
                     completionHandler: @escaping (AFDataResponse<[Product]>) -> Void) {
        let requestModel = ProductListRequest(baseUrl: baseUrl, pageNumber: pageNumber , idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductList {
    struct ProductListRequest: RequestRouter{
        
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getProductList"
        
        let pageNumber: String
        let idCategory: String
        
        var parameters: Parameters? {
        return [
            "page_number": pageNumber,
            "id_category": idCategory
        ]
        }
    }
}
