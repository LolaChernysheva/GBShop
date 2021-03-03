//
//  GetReviewsList.swift
//  GBShopTests
//
//  Created by Лолита on 02.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class GetReviewsList: XCTestCase {

    func testGetReviewsListRequest() throws {
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "reviews' list gotten")
        let getReviewsListFactory = requestFactory.makeReviewsListRequestFactory()
        getReviewsListFactory.getReviewsList(pageNumber: 1) {response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model[0].idComment, 123)
                XCTAssertEqual(model[1].idComment, 456)
                XCTAssertEqual(model[0].text, "Hello")
                XCTAssertEqual(model[1].text, "World")
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
                debugPrint(error)
            }
        }
       waitForExpectations(timeout: 3)
    }

}
