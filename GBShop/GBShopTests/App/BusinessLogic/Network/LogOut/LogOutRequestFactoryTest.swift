//
//  LogOutRequestFactoryTest.swift
//  GBShopTests
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class LogOutRequestFactoryTest: XCTestCase {

    func testLogOutRequest() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string:"http://127.0.0.1:8080")!)
        let expect = expectation(description: "logged out") //important
        let logOutFactory = requestFactory.makeLogOutRequestFactory()
        logOutFactory.logOut(id:"123") {response
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
    
    func testFailureLogOutRequest() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string:"Raj")!)
        let expect = expectation(description: "logged out") //important
        let logOutFactory = requestFactory.makeLogOutRequestFactory()
        logOutFactory.logOut(id:"123") {response
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
