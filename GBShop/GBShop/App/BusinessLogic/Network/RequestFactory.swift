//
//  RequestFactory.swift
//  GBShop
//
//  Created by Лолита on 16.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

class RequestFactory {

    func makeErrorParser() -> AbstractErrorParser {
        ErrorParser()
    }

    let baseUrl: URL

    lazy var commonSession: Session = {
    let configuration = URLSessionConfiguration.default
    configuration.httpShouldSetCookies = false
    configuration.headers = .default
    let manager = Session(configuration: configuration)
    return manager
    }()

    let sessionQueue = DispatchQueue.global(qos: .utility)

    init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }

    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeSignUpRequestFatory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeLogOutRequestFactory() -> LogOutRequestFactory {
        let errorParser = makeErrorParser()
        return LogOut(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeProductListRequestFactory() -> ProductListRequestFactory {
        let errorParser = makeErrorParser()
        return ProductList(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)

    }

    func makeGetProductRequestFactory() -> GetProductRequestFactory {
        let errorParser = makeErrorParser()
        return GetProduct(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }

    func makeRemoveReviewRequestFactory() -> RemoveReviewFactory {
        let errorParser = makeErrorParser()
        return RemoveReview(errorParser: errorParser, sessionManager: commonSession, baseUrl: baseUrl)
    }

    func makeAddReviewRequestFactory() -> AddReviewRequestFactory {
        let errorParser = makeErrorParser()
        return AddReview(errorParser: errorParser, sessionManager: commonSession, baseUrl: baseUrl)
    }

    func makeReviewsListRequestFactory() -> GetReviewsListRequestFactory {
        let errorParser = makeErrorParser()
        return GetReviewsList(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    func makeAddToBasketRequestFactory() -> AddToBasketRequestFactory {
        let errorParser = makeErrorParser()
        return AddToBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    func makeDeleteFromBasketRequestFactory() -> DeleteFromBasketRequestFactory {
        let errorParser = makeErrorParser()
        return DeleteFromBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    func makePayBasketRequestFactory() -> PayBasketRequestFactory {
        let errorParser = makeErrorParser()
        return PayBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
}
