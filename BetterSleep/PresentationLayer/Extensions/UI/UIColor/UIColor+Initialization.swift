//
//  UIColor+Initialization.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/18/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}
