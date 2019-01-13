//
//  WelcomeCoordinatorAssembly.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

final class WelcomeCoordinatorAssembly: BaseCoordinatorAssembly {
    
    // MARK: - Appearance
    
    func initialController() -> WelcomeViewController {
        return WelcomeViewController(viewModel: WelcomeControllerViewModel())
    }
}
