//
//  LaunchControllerViewModel.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/7/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class LaunchControllerViewModel: ControllerViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    let animationDuration: TimeInterval
    
    
    // MARK: - Initialization
    
    init(animationDuration: TimeInterval = 1.2) {
        self.animationDuration = animationDuration
    }
}
