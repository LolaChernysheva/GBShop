//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(id: String,
                username: String,
                password: String,
                email: String,
                gender: String,
                creditCard: String,
                bio: String,
                completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void
    )
}
