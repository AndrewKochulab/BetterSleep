//
//  MonitoringType.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/19/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

struct MonitoringType: OptionSet {
    
    // MARK: - Cases
    
    static let audio = MonitoringType(rawValue: 1 << 0, name: "audio")
    static let gyroscope = MonitoringType(rawValue: 1 << 1, name: "gyroscope")
    
    static let all: MonitoringType = [.audio, .gyroscope]
    
    
    // MARK: - Properties
    
    let rawValue: Int
    let name: String
    
    
    // MARK: - Initialization
    
    init(rawValue: Int) {
        self.init(rawValue: rawValue, name: "")
    }
    
    init(rawValue: Int, name: String) {
        self.rawValue = rawValue
        self.name = name
    }
}
