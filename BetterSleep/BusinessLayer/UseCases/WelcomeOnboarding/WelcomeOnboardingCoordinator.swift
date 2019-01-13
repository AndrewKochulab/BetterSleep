//
//  WelcomeOnboardingCoordinator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class WelcomeOnboardingCoordinator: BaseExtendedCoordinator<WelcomeOnboardingCoordinatorAssembly> {
    
    // MARK: - Appearance
    
    override func showInitialController(
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        navigationController.set(
            viewController: assembly.initialController(),
            animated: animated,
            configuration: { vc in
                
            },
            completion: completion
        )
    }
}