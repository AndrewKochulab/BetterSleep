//
//  DIPDependencyContainer.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation
import Dip

class DIPDependencyContainer: DependencyContainer {
    
    // MARK: - Types
    
    typealias Container = Dip.DependencyContainer
    
    
    // MARK: - Properties
    
    private let container: Container
    
    
    // MARK: - Initialization
    
    init(container: Container = .init()) {
        self.container = container
    }
    
    
    // MARK: - Appearance
    // MARK: Register
    
    func registerDependencies() {
        
    }
    
    func registerDependency<Dependency>(
        scope: DependencyContainerScope,
        configuration: @escaping (()) -> Dependency
    ) {
        container.register(.from(scope), factory: configuration)
    }
    
    func registerDependencyType<Dependency>(
        scope: DependencyContainerScope,
        configuration: @escaping (()) -> Dependency.Type
    ) {
        container.register(.from(scope), factory: configuration)
    }
    
    func registerDependency<Dependency, Argument>(
        scope: DependencyContainerScope,
        configuration: @escaping (Argument) -> Dependency
    ) {
        container.register(.from(scope), factory: configuration)
    }
    
    // MARK: Resolve
    
    func safeResolve<Dependency>()
        throws -> Dependency {
            return try container.resolve()
    }
    
    func resolve<Dependency>() -> Dependency {
        return try! safeResolve()
    }
    
    func safeResolve<Dependency, Argument>(
        _ argument: Argument
    ) throws -> Dependency {
        return try container.resolve(arguments: argument)
    }
    
    func resolve<Dependency, Argument>(
        _ argument: Argument
    ) -> Dependency {
        return try! safeResolve(argument)
    }
    
    func safeResolve<Dependency, Argument1, Argument2>(
        _ argument1: Argument1,
        _ argument2: Argument2
    ) throws -> Dependency {
        return try container.resolve(arguments: argument1, argument2)
    }
    
    func resolve<Dependency, Argument1, Argument2>(
        _ argument1: Argument1,
        _ argument2: Argument2
    ) -> Dependency {
        return try! safeResolve(argument1, argument2)
    }
}
