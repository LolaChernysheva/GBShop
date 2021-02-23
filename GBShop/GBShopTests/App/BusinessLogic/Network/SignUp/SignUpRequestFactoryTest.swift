//
//  SignUpRequestFactoryTest.swift
//  GBShopTests
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class SignUpRequestFactoryTest: XCTestCase {

    func testSignUpRequest() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string:"https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!)
        let expect = expectation(description: "signed up") //important
        let signUpFactory = requestFactory.makeSignUpRequestFatory()
        signUpFactory.signUp(id: "1", username: "Test", password: "Testov", email: "a@b.com", gender: "m", creditCard: "123", bio: "Fake") {response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                XCTAssertEqual(model.userMessage, "Регистрация прошла успешно!")
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)//important
            }
        }
        waitForExpectations(timeout: 10)//important
    }
    
    func testFailureSignUpRequest() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string:"Howard")!)
        let expect = expectation(description: "signed up") //important
        let signUpFactory = requestFactory.makeSignUpRequestFatory()
        signUpFactory.signUp(id: "1", username: "Test", password: "Testov", email: "a@b.com", gender: "m", creditCard: "123", bio: "Fake") {response in
            switch response.result {
            case .success(let model):
                 XCTFail("Must have failed \(model)")//important
            case .failure:
                expect.fulfill() //important
            }
        }
        waitForExpectations(timeout: 10)//important
    }

}
