//
//  SetUpProfileController.swift
//  GBShop
//
//  Created by Лолита on 16.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import UIKit

class SetUpProfileController: UIViewController {

    let setUpProfileLabel = UILabel(text: "Set up profile", font: .avenir30(), textColor: .mainWhiteColor())
    let uploadPhotoImageView = UIImageView(image: #imageLiteral(resourceName: "Upload photo"), contentMode: .scaleAspectFit)
    let nameLabel = UILabel(text: "Name", font: .avenir20(), textColor: .mainWhiteColor())
    let nameTextField = OneLineTextField(font: .avenir20())
    let surNameLabel = UILabel(text: "Surname", font: .avenir20(), textColor: .mainWhiteColor())
    let surNameTextField = OneLineTextField(font: .avenir20())
    let sexLabel = UILabel(text: "Sex", font: .avenir20(), textColor: .mainWhiteColor())
    let sexSegmentedControl = UISegmentedControl()
    let saveButton = UIButton(title: "Save", titleColor: .mainDarkGrayColor(), backgroundColor: .mainYellowColor(), font: .avenir20(), cornerRadius: 17)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainDarkGrayColor()
        setupConstraints()
        sexSegmentedControl.insertSegment(withTitle: "Male", at: 0, animated: true)
        sexSegmentedControl.insertSegment(withTitle: "Female", at: 1, animated: true)
        sexSegmentedControl.selectedSegmentTintColor = .mainYellowColor()
        sexSegmentedControl.backgroundColor = .mainLightGrayColor()
        sexSegmentedControl.selectedSegmentIndex = 0        
    }
    
    private func setupConstraints() {
        
        let nameView = LabelAndFieldView(label: nameLabel, textField: nameTextField)
        let surnameView = LabelAndFieldView(label: surNameLabel, textField: surNameTextField)
        let sexView = LabelAndSegmentedView(label: sexLabel, segmentedControl: sexSegmentedControl)
        let stackView = UIStackView(arrangedSubviews: [nameView, surnameView, sexView])
        stackView.axis = .vertical
        stackView.spacing = 35
    
        view.addSubview(setUpProfileLabel)
        view.addSubview(uploadPhotoImageView)
        view.addSubview(stackView)
        view.addSubview(saveButton)
        
        setUpProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        uploadPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            setUpProfileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            setUpProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uploadPhotoImageView.topAnchor.constraint(equalTo: setUpProfileLabel.bottomAnchor, constant: 53),
            uploadPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: uploadPhotoImageView.bottomAnchor, constant: 44),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 53),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
