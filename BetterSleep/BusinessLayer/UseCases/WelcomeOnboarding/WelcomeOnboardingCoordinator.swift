//
//  WelcomeOnboardingCoordinator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class WelcomeOnboardingCoordinator: BaseExtendedCoordinator<WelcomeOnboardingCoordinatorAssembly> {
    
    // MARK: - Properties
    // MARK: Callbacks
    
    var didCompleteTutorial: EmptyClosure?
    
    
    // MARK: - Appearance
    
    override func showInitialController(
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        navigationController.set(
            viewController: assembly.initialController(),
            animated: animated,
            configuration: { [unowned self] vc in
                vc.didComplete = {
                    self.didCompleteTutorial?()
                    self.stop()
                }
            },
            completion: completion
        )
    }
}
