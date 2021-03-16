//
//  UITextField + Extension.swift
//  GBShop
//
//  Created by Лолита on 15.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import UIKit

extension UITextField {
    convenience init(
        placeholder: String,
        textColor: UIColor,
        backgroundColor: UIColor,
        cornerRadius: CGFloat,
        font: UIFont?
    ) {
        self.init()
        self.placeholder = placeholder
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.font = font
    }

    public func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    public func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
