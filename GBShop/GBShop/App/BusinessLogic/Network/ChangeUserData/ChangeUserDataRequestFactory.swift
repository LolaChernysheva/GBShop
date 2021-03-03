//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

struct ChangeUserDataRequestFactoryModel {
    var id: String
    var username: String
    var password: String
    var email: String
    var gender: String
    var creditCard: String
    var bio: String
}

protocol ChangeUserDataRequestFactory {
    func changeUserData(
        changeUserDataRequestFactoryModel: ChangeUserDataRequestFactoryModel,
        completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void
    )
}
