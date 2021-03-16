//
//  File.swift
//  
//
//  Created by Лолита on 28.02.2021.
//

import Vapor

class AuthController {
    func register(_ req: Request) throws -> EventLoopFuture<RegisterResponse> {
        guard let body = try? req.content.decode(RegisterRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = RegisterResponse(
            result: 1,
            userMessage: "Регистрация прошла успешно!",
            error_message: nil
        )
        return req.eventLoop.future(response)
    }
    
    func changeUserData(_ req: Request) throws -> EventLoopFuture<ChangeUserDataResponse> {
        guard let body = try? req.content.decode(ChangeUserDataRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = ChangeUserDataResponse(result: 1)
        return req.eventLoop.future(response)
    }
    
    func auth(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        guard let body = try? req.content.decode(AuthRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let user: User = User(id_user: 123, user_login: "geekbrains", user_name: "John", user_lastname: "Doe")
        let response = AuthResponse(result: 1, user: user)
        
        return req.eventLoop.future(response)
    }
    
    func logout(_ req: Request) throws -> EventLoopFuture<LogoutResponse> {
        guard let body = try? req.content.decode(LogOutRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = LogoutResponse(result: 1)
        return req.eventLoop.future(response)
    }

}
