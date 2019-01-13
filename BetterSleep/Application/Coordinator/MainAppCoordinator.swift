//
//  MainAppCoordinator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/24/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation
import Dip

final class MainAppCoordinator: BaseExtendedCoordinator<MainAppCoordinatorAssembly>, AppCoordinator {
    
    // MARK: - Appearance
    
    override func showInitialController(
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        // FIXME: Check if user already watched the onboarding
        
        showLaunchController { [unowned self] in
            self.showWelcomeCoordinator(animated: animated, completion: completion)
        }
    }
    
    private func showLaunchController(
        didFinishAnimation: @escaping () -> Void
    ) {
        navigationController.set(
            viewController: assembly.launchController(),
            animated: false,
            configuration: { controller in
                controller.didFinishAnimation = didFinishAnimation
            },
            completion: { }
        )
    }
    
    private func showWelcomeCoordinator(
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        let coordinator = assembly.welcomeCoordinator(
            navigationController: navigationController
        )
        
        coordinator.didStart = completion
        coordinator.didFinish = { [unowned self, unowned coordinator] in
            self.remove(coordinator: coordinator)
        }
        
        coordinator.didStartExploringOnboarding = { [unowned self] in
            self.showWelcomeOnboardingCoordinator(animated: true)
        }
        
        add(coordinator: coordinator)
        coordinator.start(animated: animated)
    }
    
    private func showWelcomeOnboardingCoordinator(
        animated: Bool
    ) {
        let coordinator = assembly.welcomeOnboardingCoordinator(
            navigationController: navigationController
        )
        
        coordinator.didFinish = { [unowned self] in
            self.remove(coordinator: coordinator)
        }
        
        add(coordinator: coordinator)
        coordinator.start(animated: animated)
    }
    
}
