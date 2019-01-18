//
//  AlarmTime.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/18/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

struct AlarmTime {
    
    // MARK: - Type
    
    enum Component: Int, CaseIterable {
        
        // MARK: Cases
        
        case hour
        case minute
        
        // MARK: Properties
        
        var name: String {
            switch self {
                case .hour: return "hour"
                case .minute: return "minute"
            }
        }
    }
    
    
    // MARK: - Properties
    
    lazy var hour = 0
    lazy var minute = 0
    
    
    // MARK: - Appearance
    
    mutating func representation() -> String {
        return String(format: "%02d:%02d", hour, minute)
    }
    
}
