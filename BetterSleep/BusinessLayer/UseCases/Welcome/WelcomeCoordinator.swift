//
//  WelcomeCoordinator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

final class WelcomeCoordinator: BaseExtendedCoordinator<WelcomeCoordinatorAssembly> {
    
    // MARK: - Properties
    // MARK: Callbacks
    
    var didStartExploringOnboarding: EmptyClosure?
    
    
    // MARK: - Appearance
    
    override func showInitialController(
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        navigationController.set(
            controller: assembly.initialController(),
            animated: animated,
            configuration: { [unowned self] vc in
                vc.didStartExploringOnboarding = { [unowned self] in
                    self.didStartExploringOnboarding?()
                    self.stop()
                }
            },
            completion: completion
        )
    }
}
