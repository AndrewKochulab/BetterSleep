//
//  Flow.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

protocol FlowAssembly: CoordinatorAssembly { }

protocol FlowContent { }

protocol Flow: ExtendedCoordinator where Assembly: FlowAssembly {
    
    // MARK: - Types
    
    associatedtype Content: FlowContent
    
    
    // MARK: - Properties
    
    var content: Content { get }
    
}
