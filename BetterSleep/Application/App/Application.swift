//
//  Application.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/24/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import UIKit

final class Application:
    UIResponder,
    UIApplicationDelegate {
    
    // MARK: - Properties
    // MARK: Appearance
    
    let coordinator: AppCoordinator
    let window: UIWindow
    
    // MARK: Components
    
    let configuration: AppConfiguration
    
    
    // MARK: - Initialization
    
    override convenience init() {
        self.init(
            coordinator: MainAppCoordinator(
                assembly: .init(),
                navigationController: NavigationController(
                    rootViewController: UIViewController(
                        nibName: nil,
                        bundle: nil
                    )
                )
            ),
            window: .init(frame: UIScreen.main.bounds),
            configuration: MainAppConfiguration()
        )
    }
    
    init(
        coordinator: AppCoordinator,
        window: UIWindow,
        configuration: AppConfiguration
    ) {
        self.coordinator = coordinator
        self.window = window
        self.configuration = configuration
    }
    
    
    // MARK: - Appearance
    
    private func configure(using app: UIApplication) {
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
    
    
    // MARK: - UIApplicationDelegate
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        configure(using: application)
        coordinator.start(animated: false)
        
        return true
    }
}
