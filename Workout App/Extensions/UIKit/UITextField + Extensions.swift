//
//  UITextField + Extensions.swift
//  Workout App
//
//  Created by Vadim on 23.10.2022.
//

import UIKit

extension UITextField {
    convenience init(text: String = "") {
        self.init()
        self.layer.cornerRadius = 10
        self.backgroundColor = .specialBrown
        self.toAutoLayout()
    }
}
