//
//  DependencyContainer.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

protocol DependencyContainer: class {
    
    // MARK: - Appearance
    // MARK: Register
    
    func registerDependencies()
    
    func registerDependency<Dependency>(
        scope: DependencyContainerScope,
        configuration: @escaping (()) -> Dependency
    )
    
    func registerDependencyType<Dependency>(
        scope: DependencyContainerScope,
        configuration: @escaping (()) -> Dependency.Type
    )
    
    func registerDependency<Dependency, Argument>(
        scope: DependencyContainerScope,
        configuration: @escaping (Argument) -> Dependency
    )
    
    // MARK: Resolve
    
    func safeResolve<Dependency>()
        throws -> Dependency
    
    func resolve<Dependency>() -> Dependency
    
    func safeResolve<Dependency, Argument>(
        _ argument: Argument
    ) throws -> Dependency
    
    func resolve<Dependency, Argument>(
        _ argument: Argument
    ) -> Dependency
    
    func safeResolve<Dependency, Argument1, Argument2>(
        _ argument1: Argument1,
        _ argument2: Argument2
    ) throws -> Dependency
    
    func resolve<Dependency, Argument1, Argument2>(
        _ argument1: Argument1,
        _ argument2: Argument2
    ) -> Dependency

}
