//
//  BaseExtendedCoordinator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

class BaseExtendedCoordinator<
    Assembly: CoordinatorAssembly
>: BaseCoordinator, ExtendedCoordinator {
    
    // MARK: - Properties
    // MARK: Content
    
    let assembly: Assembly
    lazy var children: [Coordinator] = []
    
    
    // MARK: - Initialization
    
    init(
        assembly: Assembly,
        navigationController: NavigationController
    ) {
        self.assembly = assembly
        
        super.init(navigationController: navigationController)
        
        assembly.registerDependencies()
    }
    
    // MARK: - Appearance
    
    override func start(animated: Bool = true) {
        showInitialController(animated: animated) { [unowned self] in
            self.didStart?()
        }
    }
    
    func showInitialController(
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        notImplementedFatalError()
    }
    
    final func add(coordinator: Coordinator) {
        children.append(coordinator)
    }
    
    final func remove(coordinator: Coordinator) {
        if let position = children.lastIndex(where: { $0 === coordinator }) {
            children.remove(at: position)
        }
    }
}
