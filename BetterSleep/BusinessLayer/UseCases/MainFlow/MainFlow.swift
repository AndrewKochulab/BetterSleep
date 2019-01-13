//
//  MainFlow.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation
import ESTabBarController_swift

final class MainFlow: BaseFlow<
    MainFlowContent,
    MainFlowAssembly
> {
    
    // MARK: - Properties
    // MARK: Behaviour
    
    let tabBarController: MainTabBarController
    
    
    // MARK: - Initialization
    
    override init(
        content: Content,
        assembly: Assembly,
        navigationController: NavigationController
    ) {
        self.tabBarController = assembly.initialController()
        
        super.init(
            content: content,
            assembly: assembly,
            navigationController: navigationController
        )
    }

    
    // MARK: - Appearance
    
    override func showInitialController(
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        let statisticsCoordinator = self.statisticsCoordinator()
        let trackSleepCoordinator = self.trackSleepCoordinator()
        let settingsCoordinator = self.settingsCoordinator()
        
        let coordinators = [
            statisticsCoordinator,
            trackSleepCoordinator,
            settingsCoordinator
        ]
        
        let navigationControllers = coordinators.compactMap {
            $0.navigationController
        }
        
        statisticsCoordinator.navigationController.tabBarItem = ESTabBarItem(
            TabBarItemBounceEffectView(),
            title: "Statistics",
            image: R.image.tabBarStatistics(),
            selectedImage: nil
        )
        
        trackSleepCoordinator.navigationController.tabBarItem = ESTabBarItem(
            TabBarItemBounceEffectView(),
            title: "Track Sleep",
            image: R.image.tabBarTrackSleep(),
            selectedImage: nil
        )
        
        settingsCoordinator.navigationController.tabBarItem = ESTabBarItem(
            TabBarItemBounceEffectView(),
            title: "Settings",
            image: R.image.tabBarSettings(),
            selectedImage: nil
        )
        
        tabBarController.configure(with: navigationControllers)
        tabBarController.selectedViewController = trackSleepCoordinator.navigationController
        coordinators.forEach { $0.start() }
        
        navigationController.set(
            viewController: tabBarController,
            animated: animated,
            completion: completion
        )
    }
    
    private func statisticsCoordinator() -> StatisticsCoordinator {
        let navigationController = NavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        
        let coordinator = assembly.statisticsCoordinator(
            navigationController: navigationController
        )
        
        coordinator.didFinish = { [unowned self, unowned coordinator] in
            self.remove(coordinator: coordinator)
        }
        
        add(coordinator: coordinator)
        
        return coordinator
    }
    
    private func trackSleepCoordinator() -> TrackSleepCoordinator {
        let navigationController = NavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        
        let coordinator = assembly.trackSleepCoordinator(
            navigationController: navigationController
        )
        
        coordinator.didFinish = { [unowned self, unowned coordinator] in
            self.remove(coordinator: coordinator)
        }
        
        add(coordinator: coordinator)
        
        return coordinator
    }
    
    private func settingsCoordinator() -> SettingsCoordinator {
        let navigationController = NavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        
        let coordinator = assembly.settingsCoordinator(
            navigationController: navigationController
        )
        
        coordinator.didFinish = { [unowned self, unowned coordinator] in
            self.remove(coordinator: coordinator)
        }
        
        add(coordinator: coordinator)
        
        return coordinator
    }
}
