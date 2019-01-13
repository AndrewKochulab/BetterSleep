//
//  BaseCoordinator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    // MARK: - Properties
    // MARK: Content
    
    unowned let navigationController: NavigationController
    
    // MARK: Callbacks
    
    var didStart: DidStart?
    var didFinish: DidFinish?
    
    
    // MARK: - Initialization
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    
    // MARK: - Appearance
    
    func start(animated: Bool = true) {
        didStart?()
    }
    
    final func stop() {
        didFinish?()
    }
}
