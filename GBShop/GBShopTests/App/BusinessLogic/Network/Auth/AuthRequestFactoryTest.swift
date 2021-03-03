//
//  AuthRequestFactoryTest.swift
//  GBShopTests
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class AuthRequestFactoryTest: XCTestCase {

    func testLogin() throws {
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "logged in") // important
        let authFactory = requestFactory.makeAuthRequestFatory()
        authFactory.login(userName: "Somebody", password: "mypassword") {response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                XCTAssertEqual(model.user.id, 123)
                XCTAssertEqual(model.user.name, "John")
                XCTAssertEqual(model.user.lastname, "Doe")
                XCTAssertEqual(model.user.login, "geekbrains")

                expect.fulfill() // important
            case .failure(let error):
                XCTFail(error.localizedDescription)// important
            }
        }
        waitForExpectations(timeout: 5)// important
    }

    func testFailureLogin() throws {
        guard let baseUrl = URL(string: "SheldonCooper") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "logged in") // important
        let authFactory = requestFactory.makeAuthRequestFatory()
        authFactory.login(userName: "Somebody", password: "mypassword") {response in
            switch response.result {
            case .success(let model):
                 XCTFail("Must have failed \(model)")// important
            case .failure:
                expect.fulfill() // important
            }
        }
        waitForExpectations(timeout: 5)// important
    }
}
