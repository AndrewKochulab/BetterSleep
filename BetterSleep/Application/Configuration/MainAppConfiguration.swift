//
//  MainAppConfiguration.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

final class MainAppConfiguration: AppConfiguration {
    
    // MARK: - Types
    
    private enum Path: String {
        case debugMode = "APP_DEBUG_ENABLED"
    }
    
    
    // MARK: - Properties
    // MARK: Dictionary
    
    private lazy var infoDictionary: [String : Any] = {
        return Bundle.main.infoDictionary ?? [:]
    }()
    
    // MARK: Debugging
    
    lazy var debugEnabled: Bool = {
        return value(from: .debugMode, of: String.self) == "Yes"
    }()
    
    
    // MARK: - Appearance
    
    func url(for link: AppLinkRepresentable) -> URL {
        return link.url
    }
    
    private func value<Value>(
        from path: Path,
        of type: Value.Type = Value.self
    ) -> Value {
        return infoDictionary[path.rawValue] as! Value
    }
    
    private func url(
        from path: Path
    ) -> URL {
        let value = self.value(from: path, of: String.self)
        
        return URL(string: value)!
    }
}
