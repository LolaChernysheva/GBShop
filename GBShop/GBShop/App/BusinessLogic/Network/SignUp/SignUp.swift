//
//  SignUp.swift
//  GBShop
//
//  Created by Лолита on 16.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

class SignUp: AbstractRequestFactory {
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

extension SignUp: SignUpRequestFactory {
    func signUp(signUpRequestFactoryModel: SignUpRequestFactoryModel, completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void) {
        let requestModel = SignUpRequest(
            baseUrl: baseUrl,
            id: signUpRequestFactoryModel.id,
            username: signUpRequestFactoryModel.username,
            password: signUpRequestFactoryModel.password,
            email: signUpRequestFactoryModel.email,
            gender: signUpRequestFactoryModel.gender,
            creditCard: signUpRequestFactoryModel.creditCard,
            bio: signUpRequestFactoryModel.bio
        )
        self.request(request: requestModel, completionHandler: completionHandler)

    }
}

extension SignUp {
    struct SignUpRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "register"

        let id: String
        let username: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String

        var parameters: Parameters? {
            [
                "id_user": id,
                "username": username,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}
