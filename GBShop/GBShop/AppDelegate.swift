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
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        return true
    }

}

