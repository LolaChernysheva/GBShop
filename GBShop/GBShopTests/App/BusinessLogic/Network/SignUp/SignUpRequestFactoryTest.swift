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
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "signed up") // important
        let signUpFactory = requestFactory.makeSignUpRequestFatory()
        let myTestModel = SignUpRequestFactoryModel(
            id: "123",
            username: "Test",
            password: "Testov",
            email: "a@b.com",
            gender: "m",
            creditCard: "123",
            bio: "Fake"
        )
        signUpFactory.signUp(signUpRequestFactoryModel: myTestModel) {response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                XCTAssertEqual(model.userMessage, "Регистрация прошла успешно!")
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)// important
            }
        }
        waitForExpectations(timeout: 10)// important
    }

    func testFailureSignUpRequest() throws {
        guard let baseUrl = URL(string: "Howard") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "signed up") // important
        let signUpFactory = requestFactory.makeSignUpRequestFatory()
        let myTestModel = SignUpRequestFactoryModel(
            id: "123",
            username: "Test",
            password: "Testov",
            email: "a@b.com",
            gender: "m",
            creditCard: "123",
            bio: "Fake"
        )
       signUpFactory.signUp(signUpRequestFactoryModel: myTestModel) {response in
            switch response.result {
            case .success(let model):
                 XCTFail("Must have failed \(model)")// important
            case .failure:
                expect.fulfill() // important
            }
        }
        waitForExpectations(timeout: 10)// important
    }

}
