//
//  LogOutRequestFactory.swift
//  GBShop
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

protocol LogOutRequestFactory {
    func logOut(id: String,
                completionHandler: @escaping (AFDataResponse<LogOutResult>) -> Void
    )
    
}
