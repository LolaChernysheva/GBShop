//
//  UIImageView + Extension.swift
//  GBShop
//
//  Created by Лолита on 15.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
}
