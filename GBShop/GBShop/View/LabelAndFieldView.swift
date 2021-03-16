//
//  LabelAndFieldView.swift
//  GBShop
//
//  Created by Лолита on 16.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import UIKit

class LabelAndFieldView: UIView {
    init (
        label: UILabel,
        textField: UITextField
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        self.addSubview(textField)
        
        textField.setLeftPaddingPoints(15)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 3),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        bottomAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
