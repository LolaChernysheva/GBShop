import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    let authController = AuthController()
    app.post("register", use: authController.register)
    app.post("changeUserData", use: authController.changeUserData)
    app.post("auth", use: authController.auth)
    app.post("logout", use: authController.logout)
    
    let productController = ProductController()
    app.get("getProduct", use: productController.getProduct)
    app.get("getProductList", use: productController.getProductList)
    
    
    
    
}
