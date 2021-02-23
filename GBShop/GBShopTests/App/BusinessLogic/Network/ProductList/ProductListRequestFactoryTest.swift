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
        let requestFactory = RequestFactory(baseUrl: URL(string:"https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!)
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
        waitForExpectations(timeout: 10)
    }

    func testFailureProductListRequest() throws {
        let requestFactory = RequestFactory(baseUrl: URL(string:"Pppppppp")!)
        let expect = expectation(description: "product list")
        let productListFactory = requestFactory.makeProductListRequestFactory()
        productListFactory.productList(pageNumber: "1", idCategory: "1") {response in
            switch response.result {
            case .success(let model):
                 XCTFail("Must have failed \(model)")//important
            case .failure:
                expect.fulfill() //important
            }
        }
        waitForExpectations(timeout: 10)
    }

}
