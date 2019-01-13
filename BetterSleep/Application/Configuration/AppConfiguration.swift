//
//  AppConfiguration.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

protocol AppConfiguration {
    
    // MARK: - Properties
    // MARK: Debugging
    
    var debugEnabled: Bool { get }
    
    
    // MARK: - Appearance
    
    func url(for link: AppLinkRepresentable) -> URL
    
}
