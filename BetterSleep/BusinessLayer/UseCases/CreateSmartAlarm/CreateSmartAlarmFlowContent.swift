//
//  CreateSmartAlarmFlowContent.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class CreateSmartAlarmFlowContent: FlowContent {
    
    // MARK: - Types
    
    enum Page: CaseIterable {
        
        // MARK: Cases
        
        case chooseAlarmTime
        case chooseAlarmWindow
        case chooseMonitoringType
        
        // MARK: Appearance
        
        static func count() -> Int {
            return allCases.count
        }
        
        func previous() -> Page? {
            switch self {
                case .chooseAlarmTime:
                    return nil
                
                case .chooseAlarmWindow:
                    return .chooseAlarmTime
                
                case .chooseMonitoringType:
                    return .chooseAlarmWindow
            }
        }
        
        func next() -> Page? {
            switch self {
                case .chooseAlarmTime:
                    return .chooseAlarmWindow
                
                case .chooseAlarmWindow:
                    return .chooseMonitoringType
                
                case .chooseMonitoringType:
                    return nil
            }
        }
    }
    
    
    // MARK: - Properties
    
    var visiblePage: Page = .chooseAlarmTime
    
}
