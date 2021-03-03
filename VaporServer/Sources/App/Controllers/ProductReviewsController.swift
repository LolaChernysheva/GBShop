//
//  ProductReviewsController.swift
//  
//
//  Created by Лолита on 02.03.2021.
//

import Vapor

class ProductReviewsController {
    
    func removeReview (_ req: Request) throws -> EventLoopFuture<RemoveReviewResponse> {
       
        guard let body = try? req.content.decode(RemoveReviewRequest.self) else {
            throw Abort(.badRequest)
        }
        print(body)
        
        let response = RemoveReviewResponse(result: 1)
        return req.eventLoop.future(response)
    }
    
    func addReview (_ req: Request) throws -> EventLoopFuture<AddReviewResponse> {
        
        guard let body = try? req.content.decode(AddReviewRequest.self) else {
            throw Abort(.badRequest)
        }
        print(body)
        
        let response = AddReviewResponse(result: 1, userMessage:  "Ваш отзыв был передан на модерацию")
        return req.eventLoop.future(response)
    }
    
    func getReviewsList (_ req: Request) throws -> EventLoopFuture<[Reviews]> {
        guard let body = try? req.query.decode(GetReviewsListRequest.self) else {
            throw Abort(.badRequest)
        }
        print(body)
        
        var response: [Reviews] = []
        response.append(Reviews(id_comment: 123, text: "Hello"))
        response.append(Reviews(id_comment: 456, text: "World"))
        return req.eventLoop.future(response)
    }
    
}
