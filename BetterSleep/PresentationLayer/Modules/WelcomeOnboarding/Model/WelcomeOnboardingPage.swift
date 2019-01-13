//
//  WelcomeOnboardingPage.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

struct WelcomeOnboardingPage: Equatable {
    
    // MARK: - Types
    
    enum BackgroundColor {
        case niagara,
        curiousBlue,
        madison
        
        var color: UIColor {
            switch self {
                case .niagara:
                    return UIColor(red: 0.09, green: 0.63, blue: 0.52, alpha: 1)
                
                case .curiousBlue:
                    return UIColor(red: 0.16, green: 0.50, blue: 0.73, alpha: 1)
                
                case .madison:
                    return UIColor(red: 0.17, green: 0.24, blue: 0.31, alpha: 1)
            }
        }
    }
    
    
    // MARK: - Properties
    
    var title: String
    var description: String
    var imagePath: String
    var iconPath: String
    var backgroundColorType: BackgroundColor
    
    init(title: String,
         description: String,
         imagePath: String,
         iconPath: String,
         backgroundColorType: BackgroundColor
    ) {
        self.title = title
        self.description = description
        self.imagePath = imagePath
        self.iconPath = iconPath
        self.backgroundColorType = backgroundColorType
    }
}


