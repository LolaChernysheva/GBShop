//
//  ChangeUserData.swift
//  GBShop
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

class ChangeUserData: AbstractRequestFactory {
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

extension ChangeUserData: ChangeUserDataRequestFactory {
    func changeUserData(
        changeUserDataRequestFactoryModel: ChangeUserDataRequestFactoryModel,
        completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void
    ) {
        let requestModel = ChangeUserDataRequest(baseUrl: baseUrl,
                                                 id: changeUserDataRequestFactoryModel.id,
                                                 username: changeUserDataRequestFactoryModel.username,
                                                 password: changeUserDataRequestFactoryModel.password,
                                                 email: changeUserDataRequestFactoryModel.email,
                                                 gender: changeUserDataRequestFactoryModel.gender,
                                                 creditCard: changeUserDataRequestFactoryModel.creditCard,
                                                 bio: changeUserDataRequestFactoryModel.bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeUserData {
    struct ChangeUserDataRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "changeUserData"
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
