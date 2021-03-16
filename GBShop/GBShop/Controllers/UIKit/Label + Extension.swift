//
//  Label + Extension.swift
//  GBShop
//
//  Created by Лолита on 15.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init (text: String, font: UIFont?, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
