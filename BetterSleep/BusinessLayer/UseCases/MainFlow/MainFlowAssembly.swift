//
//  MainFlowAssembly.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class MainFlowAssembly: BaseFlowAssembly {
    
    // MARK: - Appearance
    
    func initialController(
        viewModel: MainTabBarControllerViewModel = .init()
    ) -> MainTabBarController {
        return MainTabBarController(viewModel: viewModel)
    }
    
    func statisticsCoordinator(
        navigationController: NavigationController
    ) -> StatisticsCoordinator {
        return .init(
            assembly: .init(),
            navigationController: navigationController
        )
    }
    
    func trackSleepCoordinator(
        navigationController: NavigationController
    ) -> TrackSleepCoordinator {
        return .init(
            assembly: .init(),
            navigationController: navigationController
        )
    }
    
    func settingsCoordinator(
        navigationController: NavigationController
    ) -> SettingsCoordinator {
        return .init(
            assembly: .init(),
            navigationController: navigationController
        )
    }
    
}
