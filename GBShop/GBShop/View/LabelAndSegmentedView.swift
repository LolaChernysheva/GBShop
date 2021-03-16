//
//  LabelAndSegmentedView.swift
//  GBShop
//
//  Created by Лолита on 16.03.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

import UIKit

class LabelAndSegmentedView: UIView {
    init(
        label: UILabel,
        segmentedControl: UISegmentedControl
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        self.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            segmentedControl.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 13),
            segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
