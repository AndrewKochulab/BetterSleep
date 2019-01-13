//
//  TrackSleepCoordinator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class TrackSleepCoordinator: BaseExtendedCoordinator<
    TrackSleepCoordinatorAssembly
> {
    
    // MARK: - Appearance
    
    override func showInitialController(
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        navigationController.set(
            viewController: assembly.initialController(),
            animated: animated,
            completion: completion
        )
    }
    
}
