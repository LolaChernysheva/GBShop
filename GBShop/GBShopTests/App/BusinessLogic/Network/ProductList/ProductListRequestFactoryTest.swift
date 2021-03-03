//
//  ProductListRequestFactoryTest.swift
//  GBShopTests
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class ProductListRequestFactoryTest: XCTestCase {

    func testProductListRequest() throws {
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "product list")
        let productListFactory = requestFactory.makeProductListRequestFactory()
        productListFactory.productList(pageNumber: "1", idCategory: "1") {response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model[0].idProduct, 123)
                XCTAssertEqual(model[1].idProduct, 456)
                XCTAssertEqual(model[0].productName, "Ноутбук")
                XCTAssertEqual(model[1].productName, "Мышка")
                XCTAssertEqual(model[0].price, 45600)
                XCTAssertEqual(model[1].price, 1000)
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testFailureProductListRequest() throws {
        guard let baseUrl = URL(string: "Pppppppp") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "product list")
        let productListFactory = requestFactory.makeProductListRequestFactory()
        productListFactory.productList(pageNumber: "1", idCategory: "1") {response in
            switch response.result {
            case .success(let model):
                 XCTFail("Must have failed \(model)")// important
            case .failure:
                expect.fulfill() // important
            }
        }
        waitForExpectations(timeout: 3)
    }

}
