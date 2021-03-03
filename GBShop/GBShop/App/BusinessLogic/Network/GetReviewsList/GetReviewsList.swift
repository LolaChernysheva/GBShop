//
//  GetReviewsList.swift
//  GBShop
//
//  Created by Лолита on 02.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

class GetReviewsList: AbstractRequestFactory {
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

extension GetReviewsList: GetReviewsListRequestFactory {
    func getReviewsList(pageNumber: Int, completionHandler: @escaping (AFDataResponse<[Reviews]>) -> Void) {
        let requestModel = GetReviewsListRequest(baseUrl: baseUrl, pageNumber: pageNumber)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension GetReviewsList {
    struct GetReviewsListRequest: RequestRouter {
       let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getReviewsList"

        let pageNumber: Int

        var parameters: Parameters? {
            [
                "page_number": pageNumber
            ]
        }
    }
}
