//
//  TrackSleepCoordinatorAssembly.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class TrackSleepCoordinatorAssembly: BaseCoordinatorAssembly {
    
    // MARK: - Appearance
    
    func initialController(
        viewModel: TrackSleepControllerViewModel = .init()
    ) -> TrackSleepViewController {
        return .init(
            viewModel: viewModel
        )
    }
    
}
