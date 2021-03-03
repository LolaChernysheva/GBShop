//
//  AddReviewTest.swift
//  GBShopTests
//
//  Created by Лолита on 02.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class AddReviewTest: XCTestCase {

    func testAddReviewRequest() throws {
        guard let baseUrl = URL(string: "http://127.0.0.1:8080") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "Review added")
        let addReviewFactory = requestFactory.makeAddReviewRequestFactory()
        addReviewFactory.addReview(idUser: 123, text: "Текст отзыва") {response
            in
            switch response.result {
            case .success(let model):
                 XCTAssertEqual(model.result, 1)
                 XCTAssertEqual(model.userMessage, "Ваш отзыв был передан на модерацию")

                 expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)

            }
        }
        waitForExpectations(timeout: 5)
    }

    func testFailureAddReview() throws {
        guard let baseUrl = URL(string: "SheldonCooper") else { return }
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let expect = expectation(description: "Review added")
        let addReviewFactory = requestFactory.makeAddReviewRequestFactory()
        addReviewFactory.addReview(idUser: 123, text: "Текст отзыва") {response
            in
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
