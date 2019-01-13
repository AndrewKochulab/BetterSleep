//
//  TabBarItemBounceEffectView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit
import ESTabBarController_swift

final class TabBarItemBounceEffectView: ESTabBarItemContentView {
    
    // MARK: - Properties
    
    var duration = 0.3
    
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let normalColor = UIColor(white: 240.0 / 255.0, alpha: 1.0)
        let highlightedColor = UIColor(red: 22.0 / 255.0, green: 160.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
        
        textColor = normalColor
        highlightTextColor = highlightedColor
        iconColor = normalColor
        highlightIconColor = highlightedColor
    }
    
    public required init?(coder aDecoder: NSCoder) {
        return nil // No needed
    }
    
    
    // MARK: - Appearance
    
    override func selectAnimation(
        animated: Bool,
        completion: (() -> ())?
    ) {
        bounceAnimation()
        completion?()
    }
    
    func bounceAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}

