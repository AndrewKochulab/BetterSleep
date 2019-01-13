//
//  MainAppCoordinatorAssembly.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/5/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class MainAppCoordinatorAssembly: BaseCoordinatorAssembly {
    
    // MARK: - Appearance
    
    func welcomeCoordinator(
        navigationController: NavigationController
    ) -> WelcomeCoordinator {
        return WelcomeCoordinator(
            assembly: .init(),
            navigationController: navigationController
        )
    }
    
    func welcomeOnboardingCoordinator(
        navigationController: NavigationController
    ) -> WelcomeOnboardingCoordinator {
        return WelcomeOnboardingCoordinator(
            assembly: .init(),
            navigationController: navigationController
        )
    }
    
    func launchController() -> LaunchViewController {
        return LaunchViewController(viewModel: .init())
    }
    
}
