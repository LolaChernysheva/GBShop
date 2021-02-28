//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Лолита on 16.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?,
               data: Data?,
               error: Error?) -> Error?
               
}
