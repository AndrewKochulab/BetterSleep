//
//  StatisticsCoordinatorAssembly.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class StatisticsCoordinatorAssembly: BaseCoordinatorAssembly {
    
    // MARK: - Appearance
    
    func initialController(
        viewModel: StatisticsControllerViewModel = .init()
    ) -> StatisticsViewController {
        return .init(
            viewModel: viewModel
        )
    }
    
}
