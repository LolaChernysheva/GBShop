//
//  RequestFactory.swift
//  GBShop
//
//  Created by Лолита on 16.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import Foundation
import Alamofire

class RequestFactory {

    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }

    lazy var commonSession: Session = {
    let configuration = URLSessionConfiguration.default
    configuration.httpShouldSetCookies = false
    configuration.headers = .default
    let manager = Session(configuration: configuration)
    return manager
    }()

    let sessionQueue = DispatchQueue.global(qos: .utility)

    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeSignUpRequestFatory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogOutRequestFactory() -> LogOutRequestFactory {
        let errorParser = makeErrorParser()
        return LogOut(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
}

