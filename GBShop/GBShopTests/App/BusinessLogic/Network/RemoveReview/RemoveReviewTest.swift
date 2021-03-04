//
//  RemoveReviewTest.swift
//  GBShopTests
//
//  Created by Лолита on 01.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class RemoveReviewTest: XCTestCase {

    func testRemoveReviewRequest() throws {
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "Review removed")
        let removeReviewFactory = requestFactory.makeRemoveReviewRequestFactory()
        removeReviewFactory.removeReview(idComment: 123) {response
            in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)

                expect.fulfill()

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testFailureRemoveReviewRequest() throws {
        guard let baseUrl = URL(string: "SheldonCooper") else { return }
       let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "Review removed")
        let removeReviewFactory = requestFactory.makeRemoveReviewRequestFactory()
        removeReviewFactory.removeReview(idComment: 123) {response
            in
            switch response.result {
            case .success(let model):
                XCTFail("Must have failed \(model)")
            case .failure:
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 3)

    }

}
