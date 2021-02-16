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
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
    errorParser: AbstractErrorParser,
    sessionManager: Session,
    queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        
    self.errorParser = errorParser
    self.sessionManager = sessionManager
    self.queue = queue
    }
}

extension SignUp: SignUpRequestFactory {
    func signUp(id: String, username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = SignUpRequest(
            baseUrl: baseUrl, id: id, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio
        )
        self.request(request: requestModel, completionHandler: completionHandler)
        
    }
}
    
    

extension SignUp {
    struct SignUpRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        let id: String
        let username: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
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

