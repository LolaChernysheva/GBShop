//
//  File.swift
//  
//
//  Created by Лолита on 28.02.2021.
//

import Vapor

class ProductController {
    
    func getProduct(_ req: Request) throws -> EventLoopFuture<GetProductResponse> {
        guard let body = try? req.query.decode(GetProductRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = GetProductResponse(
            result: 1,
            product_name: "Ноутбук",
            product_price: 45600,
            product_description: "Мощный игровой ноутбук")
        return req.eventLoop.future(response)
    }
    
    func getProductList(_ req: Request) throws -> EventLoopFuture<[Product]> {
        guard let body = try? req.query.decode(ProductListRequest.self) else {
            throw Abort(.badRequest)
        }
        print(body)
        
        var response: [Product] = []
        response.append(Product(id_product: 123, product_name: "Ноутбук", price: 45600))
        response.append(Product(id_product: 456, product_name: "Мышка", price: 1000))
        
        return req.eventLoop.future(response)
        
    }
    
}
