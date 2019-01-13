//
//  ExtendedCoordinator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

protocol CoordinatorAssembly: DependencyContainer { }

protocol ExtendedCoordinator: Coordinator {
    
    // MARK: - Types
    
    associatedtype Assembly: CoordinatorAssembly
    
    
    // MARK: - Properties
    
    var assembly: Assembly { get }
    var children: [Coordinator] { get }
    
    
    // MARK: - Appearance
    
    func showInitialController(
        animated: Bool,
        completion: @escaping () -> Void
    )
    
    func add(coordinator: Coordinator)
    func remove(coordinator: Coordinator)
    
}
