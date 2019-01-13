//
//  Application.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/24/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import UIKit

final class Application {
    
    // MARK: - Properties
    // MARK: Appearance
    
    let coordinator: AppCoordinator
    let window: UIWindow
    
    // MARK: Components
    
    let configuration: AppConfiguration
    
    
    // MARK: - Initialization
    
    init(
        coordinator: AppCoordinator,
        window: UIWindow = .init(frame: UIScreen.main.bounds),
        configuration: AppConfiguration
    ) {
        self.coordinator = coordinator
        self.window = window
        self.configuration = configuration
    }
    
    
    // MARK: - Appearance
    
    func configure(using app: UIApplication) {
        window.rootViewController = coordinator.navigationController
        window.makeKeyAndVisible()
        
        configureUI()
        configureLibraries()
        configureComponents()
    }
    
    private func configureUI() {
        coordinator.navigationController.setNeedsStatusBarAppearanceUpdate()
    }

    private func configureLibraries() {
        
    }
    
    private func configureComponents() {
        
    }
}
