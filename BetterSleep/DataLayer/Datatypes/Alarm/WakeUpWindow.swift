//
//  WakeUpWindow.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/19/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

struct WakeUpWindow {
    
    // MARK: - Types
    
    enum Value: CaseIterable {
        
        // MARK: Cases
        
        case fiveMinutes
        case tenMinutes
        case fifteenMinutes
        case twentyMinutes
        case twentyFiveMinutes
        case thirtyMinutes
        
        // MARK: Properties
        
        var minutes: Double {
            switch self {
                case .fiveMinutes:
                    return 5
                
                case .tenMinutes:
                    return 10
                
                case .fifteenMinutes:
                    return 15
                
                case .twentyMinutes:
                    return 20
                
                case .twentyFiveMinutes:
                    return 25
                
                case .thirtyMinutes:
                    return 30
            }
        }
        
        var seconds: TimeInterval {
            return minutes * 60
        }
        
        var name: String {
            switch self {
                case .fiveMinutes:
                    return "Five minutes"

                case .tenMinutes:
                    return "Ten minutes"

                case .fifteenMinutes:
                    return "Fifteen minutes"

                case .twentyMinutes:
                    return "Twenty minutes"

                case .twentyFiveMinutes:
                    return "Twenty five minutes"

                case .thirtyMinutes:
                    return "Thirty minutes"
            }
        }
        
    }
    
    // MARK: - Properties
    
    let value: Value
    
}
