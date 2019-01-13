//
//  DependencyContainerScope.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

enum DependencyContainerScope {
    
    // MARK: - Cases
    
    case unique
    case shared
    case singleton
    case eagerSingleton
    case weakSingleton
    
}
