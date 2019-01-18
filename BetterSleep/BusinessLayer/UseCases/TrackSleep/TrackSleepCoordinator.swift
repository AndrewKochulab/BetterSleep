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
            controller: assembly.initialController(),
            animated: animated,
            configuration: { vc in
                vc.willCreateSmartAlarm = { [unowned self] in
                    self.showCreateSmartAlarmFlow(animated: false)
                }
            },
            completion: completion
        )
    }
    
    private func showCreateSmartAlarmFlow(
        animated: Bool
    ) {
        let flow = assembly.createSmartAlarmFlow(
            navigationController: navigationController
        )
        
        flow.didFinish = { [unowned self, unowned flow] in
            self.remove(coordinator: flow)
        }
        
        add(coordinator: flow)
        flow.start(animated: animated)
    }
    
}
