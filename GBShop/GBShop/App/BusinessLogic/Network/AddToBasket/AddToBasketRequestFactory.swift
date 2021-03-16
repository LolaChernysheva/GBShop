//
//  AddToBasketRequestFactory.swift
//  GBShop
//
//  Created by Лолита on 04.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

protocol AddToBasketRequestFactory {
    func addToBasket(
        idProduct: Int,
        quantity: Int,
        completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void
    )
}
