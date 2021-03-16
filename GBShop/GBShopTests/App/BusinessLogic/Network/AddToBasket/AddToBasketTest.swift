//
//  AddToBasketTest.swift
//  GBShopTests
//
//  Created by Лолита on 04.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class AddToBasketTest: XCTestCase {

    func testAddToBasketRequest() throws {
       guard let baseUrl = URL(string: "http://127.0.0.1:8080") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "Added to basket")
        let addToBasketFactory = requestFactory.makeAddToBasketRequestFactory()
        addToBasketFactory.addToBasket(idProduct: 123, quantity: 1) { response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
                print(error)
            }
        }
        waitForExpectations(timeout: 5)
    }
    func testFailureAddToBasketRequest() throws {
               guard let baseUrl = URL(string: "fix") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "Added to basket")
        let addToBasketFactory = requestFactory.makeAddToBasketRequestFactory()
        addToBasketFactory.addToBasket(idProduct: 123, quantity: 1) { response in
            switch response.result {
            case .success(let model):
                XCTFail("Must have failed \(model)")
            case .failure:
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
    }
}
