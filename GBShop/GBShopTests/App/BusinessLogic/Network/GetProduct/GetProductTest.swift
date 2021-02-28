//
//  GetProductTest.swift
//  GBShopTests
//
//  Created by Лолита on 23.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop


class GetProductTest: XCTestCase {

    func testGetProductRequest() throws {
           let requestFactory = RequestFactory(baseUrl: URL(string:"http://127.0.0.1:8080")!)
           let expect = expectation(description: "product list")
           let getProductFactory = requestFactory.makeGetProductRequestFactory()
           getProductFactory.getProduct(idProduct: 1234) {response in
               switch response.result {
               case .success(let model):
                   XCTAssertEqual(model.result, 1)
                   XCTAssertEqual(model.productName, "Ноутбук")
                   XCTAssertEqual(model.productPrice, 45600)
                   XCTAssertEqual(model.productDescription, "Мощный игровой ноутбук")
                   expect.fulfill()
               case .failure(let error):
                   XCTFail(error.localizedDescription)
               }
           }
           waitForExpectations(timeout: 3)
       }

       func testFailureGetProductRequest() throws {
            let requestFactory = RequestFactory(baseUrl: URL(string:"rtyu")!)
            let expect = expectation(description: "product list")
            let getProductFactory = requestFactory.makeGetProductRequestFactory()
            getProductFactory.getProduct(idProduct: 123) {response in
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
