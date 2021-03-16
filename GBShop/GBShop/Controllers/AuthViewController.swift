//
//  ViewController.swift
//  GBShop
//
//  Created by Лолита on 09.02.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    let emailTextField = UITextField(placeholder: " Email", textColor: .mainWhiteColor(), backgroundColor: .mainWhiteColor(), cornerRadius: 17.0, font: .avenir15())
    let passwordTextField = UITextField(placeholder: " Password", textColor: .mainWhiteColor(), backgroundColor: .mainWhiteColor(), cornerRadius: 17.0, font: .avenir15())
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    let welcomeLabel = UILabel(text: "Welcome to GB Shop", font: .avenir30(), textColor: .mainWhiteColor())
    let authButton = UIButton(title: "SIGN IN", titleColor: .mainDarkGrayColor(), backgroundColor: .mainYellowColor(), font: .avenir15(), isShadow: true, cornerRadius: 17.0)
    let goToSignUpButton = UIButton(title: "Sign Up", titleColor: .mainYellowColor(), backgroundColor: .mainDarkGrayColor(), font: .avenir20(), cornerRadius: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainDarkGrayColor()
        setupConstraints()
        goToSignUpButton.addTarget(self, action: #selector(goToSignUpController), for: .touchUpInside)
        authButton.addTarget(self, action: #selector(goToSetUpProfilepController), for: .touchUpInside)
    }
    
    @objc func goToSignUpController () {
        let vc = SignUpController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func goToSetUpProfilepController () {
        let vc = SetUpProfileController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func setupConstraints() {
        view.addSubview(logoImageView)
        view.addSubview(welcomeLabel)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 80).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let formView = AuthFormView(emailTextField: emailTextField, passwordTextField: passwordTextField, authButton: authButton, goToSignUpButton: goToSignUpButton)
        view.addSubview(formView)
        formView.translatesAutoresizingMaskIntoConstraints = false
        formView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20).isActive = true
        formView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}
