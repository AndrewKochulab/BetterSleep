//
//  WelcomeOnboardingCoordinatorAssembly.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class WelcomeOnboardingCoordinatorAssembly: BaseCoordinatorAssembly {
    
    // MARK: - Appearance
    
    override func registerDependencies() {
        super.registerDependencies()
        
        registerDependency(scope: .unique) {
            WelcomeOnboardingViewController(viewModel: WelcomeOnboardingControllerViewModel())
        }
    }
    
    func initialController() -> WelcomeOnboardingViewController {
        return resolve()
    }
}
