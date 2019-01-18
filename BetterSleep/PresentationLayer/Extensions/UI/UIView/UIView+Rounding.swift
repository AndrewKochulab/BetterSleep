//
//  UIView+Rounding.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Rounding
    
    func round(
        corners: UIRectCorner = .allCorners,
        radius: Double,
        in bounds: CGRect
    ) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = path.cgPath
        
        layer.mask = maskLayer
    }
    
    func round(
        corners: UIRectCorner = .allCorners,
        radius: Double
    ) {
        round(corners: corners, radius: radius, in: bounds)
    }
    
    func round(
        radius: CGFloat
    ) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
    }
}
