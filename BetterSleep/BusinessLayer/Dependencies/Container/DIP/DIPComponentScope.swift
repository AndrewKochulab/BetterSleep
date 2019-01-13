//
//  DIPComponentScope.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation
import Dip

extension ComponentScope {
    static func from(_ scope: DependencyContainerScope) -> ComponentScope {
        switch scope {
            case .unique:
                return .unique
            
            case .shared:
                return .shared
            
            case .singleton:
                return .singleton
            
            case .eagerSingleton:
                return .eagerSingleton
            
            case .weakSingleton:
                return .weakSingleton
        }
    }
}
