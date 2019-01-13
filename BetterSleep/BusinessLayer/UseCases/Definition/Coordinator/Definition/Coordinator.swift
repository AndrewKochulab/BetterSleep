//
//  Coordinator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/24/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    
    // MARK: - Types
    
    typealias DidStart = EmptyClosure
    typealias DidFinish = EmptyClosure
    
    
    // MARK: - Properties
    // MARK: Content
    
    var navigationController: NavigationController { get }
    
    // MARK: Callback
    
    var didStart: DidStart? { get set }
    var didFinish: DidFinish? { get }
    
    
    // MARK: - Appearance
    
    func start(animated: Bool)
    func stop()
    
}
