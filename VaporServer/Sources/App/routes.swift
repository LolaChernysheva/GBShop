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
    app.post("addToBasket", use: productController.addToBasket)
    app.post("deleteFromBasket", use: productController.deleteFromBasket)
    
    let productReviewsController = ProductReviewsController()
    app.post("removeReview", use: productReviewsController.removeReview)
    app.post("addReview", use: productReviewsController.addReview)
    app.get("getReviewsList", use: productReviewsController.getReviewsList)
    
    let basketController = BasketController()
    app.post("payBasket", use: basketController.payBasket)
    
    
    
}
