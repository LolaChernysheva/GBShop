//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Лолита on 16.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void
    )
}
