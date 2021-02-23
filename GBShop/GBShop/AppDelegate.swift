//
//  AppDelegate.swift
//  GBShop
//
//  Created by Лолита on 09.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let authFactory = requestFactory.makeAuthRequestFatory()
        authFactory.login(userName: "Somebody", password: "mypassword") {response in
            switch response.result {
            case .success(let login):
                print("Login", login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let signUp = requestFactory.makeSignUpRequestFatory()
        signUp.signUp(id: "1", username: "Test", password: "Testov", email: "a@b.com", gender: "m", creditCard: "123", bio: "Fake") {response in
            switch response.result {
            case .success(let message):
                print("SignUp", message)
            case .failure(let error):
                print(error.errorDescription)
            }
        }
        
        let logOut = requestFactory.makeLogOutRequestFactory()
        logOut.logOut(id: "123") {response
            in
            switch response.result {
            case .success(let result):
                print("logout", result)
            case .failure(let error):
                print(error.errorDescription)
            }
        }
        
        let changeUserData = requestFactory.makeChangeUserDataRequestFactory()
        changeUserData.changeUserData(id: "123", username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") {response
            in
            switch response.result {
            case .success(let result):
                print("Change user data", result)
            case .failure(let error):
                print(error.errorDescription)
            }
        }
        
        return true
    }

}

