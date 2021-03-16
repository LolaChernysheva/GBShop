//
//  RemoveReview.swift
//  GBShop
//
//  Created by Лолита on 01.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

class RemoveReview: AbstractRequestFactory {

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

extension RemoveReview: RemoveReviewFactory {

    func removeReview(idComment: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {

        let requestModel = RemoveReviewRequest(baseUrl: baseUrl, idComment: idComment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RemoveReview {
    struct RemoveReviewRequest: RequestRouter {

        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "removeReview"

        let idComment: Int

        var parameters: Parameters? {
            [
                "id_comment": idComment
            ]
        }
    }
}
