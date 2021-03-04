//
//  BasketController.swift
//  
//
//  Created by Лолита on 04.03.2021.
//

import Vapor

class BasketController {
    
    func payBasket(_ req: Request) throws -> EventLoopFuture<PayBasketResponse> {
        guard let body = try? req.content.decode(PayBasketRequest.self) else {
            throw Abort(.badRequest)
        }
        print(body)
        let response = PayBasketResponse(id: 123, price: Price(amount: 12, currency: "EUR"))
        return req.eventLoop.future(response)
    }
}
