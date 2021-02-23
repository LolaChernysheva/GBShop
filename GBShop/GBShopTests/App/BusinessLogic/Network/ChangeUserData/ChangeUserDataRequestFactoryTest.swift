//
//  ChangeUserDataRequestFactoryTest.swift
//  GBShopTests
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class ChangeUserDataRequestFactoryTest: XCTestCase {

    func testChangeUserDataRequest() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string:"https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!)
        let expect = expectation(description: "User Data changed") //important
        let changeUserDataFactory = requestFactory.makeChangeUserDataRequestFactory()
        changeUserDataFactory.changeUserData(id: "123", username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") {response
            in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)//important
            }
        }
        waitForExpectations(timeout: 5)//important
    }
    
    func testFailureChangeUserDataRequest() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string:"Leonard")!)
        let expect = expectation(description: "User Data changed") //important
        let changeUserDataFactory = requestFactory.makeChangeUserDataRequestFactory()
        changeUserDataFactory.changeUserData(id: "123", username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") {response
            in
            switch response.result {
            case .success(let model):
                XCTFail("Must have failed \(model)")//important
            case .failure:
                expect.fulfill() //important
               
            }
        }
        waitForExpectations(timeout: 5)//important
    }

}
