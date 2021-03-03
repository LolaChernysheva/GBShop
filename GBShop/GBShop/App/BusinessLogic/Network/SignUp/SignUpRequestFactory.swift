//
//  SignUpRequestFactory.swift
//  GBShop
//
//  Created by Лолита on 16.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

struct SignUpRequestFactoryModel {
    var id: String
    var username: String
    var password: String
    var email: String
    var gender: String
    var creditCard: String
    var bio: String
}

protocol SignUpRequestFactory {
    func signUp(
        signUpRequestFactoryModel: SignUpRequestFactoryModel,
        completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void
    )
}
