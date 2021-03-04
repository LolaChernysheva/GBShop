//
//  PayBasketTest.swift
//  GBShopTests
//
//  Created by Лолита on 04.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class PayBasketTest: XCTestCase {

    func testPayBasketRequest() throws {
       guard let baseUrl = URL(string: "http://127.0.0.1:8080") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "Basket payed")
        let payBasketFactory = requestFactory.makePayBasketRequestFactory()
        payBasketFactory.payBasket(id: 123) { response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.id, 123)
                XCTAssertEqual(model.price.amount, 12)
                XCTAssertEqual(model.price.currency, "EUR")
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    func testFailurePayBasket() throws {
        guard let baseUrl = URL(string: "something") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "Basket payed")
        let payBasketFactory = requestFactory.makePayBasketRequestFactory()
        payBasketFactory.payBasket(id: 123) { response in
            switch response.result {
            case .success(let model):
                XCTFail("Must have failed \(model)")
            case .failure:
                expect.fulfill() // important
            }
        }
        waitForExpectations(timeout: 5)
    }
}
