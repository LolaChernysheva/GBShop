//
//  SignUpController.swift
//  GBShop
//
//  Created by Лолита on 16.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    let signUpLabel = UILabel(text: "Sign Up", font: .avenir30(), textColor: .mainWhiteColor())
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    let nameLabel = UILabel(text: "Name", font: .avenir20(), textColor: .mainWhiteColor())
    let nameTextField = UITextField(placeholder: "IvanIvanov", textColor: .mainWhiteColor(), backgroundColor: .mainWhiteColor(), cornerRadius: 17.0, font: .avenir15())
    let emailLabel = UILabel(text: "Email", font: .avenir20(), textColor: .mainWhiteColor())
    let emailTextField = UITextField(placeholder: "ivan.ivanov@mail.ru", textColor: .mainWhiteColor(), backgroundColor: .mainWhiteColor(), cornerRadius: 17.0, font: .avenir15())
    let passwordLabel = UILabel(text: "Password", font: .avenir20(), textColor: .mainWhiteColor())
    let passwordTextField = UITextField(placeholder: "6+ symbols", textColor: .mainWhiteColor(), backgroundColor: .mainWhiteColor(), cornerRadius: 17.0, font: .avenir15())
    let signUpButton = UIButton(title: "SIGN UP", titleColor: .mainDarkGrayColor(), backgroundColor: .mainYellowColor(), font: .avenir15(), isShadow: true, cornerRadius: 17.0)
    let goToSignInButton = UIButton(title: "Sign In", titleColor: .mainYellowColor(), backgroundColor: .mainDarkGrayColor(), font: .avenir20(), cornerRadius: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainDarkGrayColor()
        setupConstraints()
        nameTextField.setLeftPaddingPoints(15)
        emailTextField.setLeftPaddingPoints(15)
        passwordTextField.setLeftPaddingPoints(15)
    
        goToSignInButton.addTarget(self, action: #selector(goToAuthController), for: .touchUpInside)
    }
    @objc func goToAuthController () {
        let vc = AuthViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    private func setupConstraints() {
        let nameView = LabelAndFieldView(label: nameLabel, textField: nameTextField)
        let emailView = LabelAndFieldView(label: emailLabel, textField: emailTextField)
        let passwordView = LabelAndFieldView(label: passwordLabel, textField: passwordTextField)
        let stackView = UIStackView(arrangedSubviews: [nameView, emailView, passwordView])
        stackView.axis = .vertical
        stackView.spacing = 35
        
        view.addSubview(logoImageView)
        view.addSubview(signUpLabel)
        view.addSubview(stackView)
        view.addSubview(signUpButton)
        view.addSubview(goToSignInButton)

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        goToSignInButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 53),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 63),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            
            goToSignInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30),
            goToSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            goToSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            goToSignInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
