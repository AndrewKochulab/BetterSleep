//
//  SettingsCoordinatorAssembly.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class SettingsCoordinatorAssembly: BaseCoordinatorAssembly {
    
    // MARK: - Appearance
    
    func initialController(
        viewModel: SettingsControllerViewModel = .init()
    ) -> SettingsViewController {
        return .init(
            viewModel: viewModel
        )
    }
    
}
