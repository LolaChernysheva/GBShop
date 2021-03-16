//
//  DeleteFromBasketRequestFactory.swift
//  GBShop
//
//  Created by Лолита on 04.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

protocol DeleteFromBasketRequestFactory {
    func deleteFromBasket(
        idProduct: Int,
        completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void
    )
}
