//
//  WelcomeOnboardingViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class WelcomeOnboardingViewController: ViewController<
    WelcomeOnboardingControllerView,
    WelcomeOnboardingControllerViewModel
> {
    
    // MARK: - Properties
    // MARK: Communicators
    
    private lazy var onboardingCommunicator = configuredOnboardingCommunicator()
    
    // MARK: Callbacks
    
    var didComplete: EmptyClosure?
    
    
    // MARK: - View
    // MARK: Configuration
    
    override func configureView() {
        super.configureView()
        
        onboardingCommunicator.setupBehaviour()
    }
    
    private func configuredOnboardingCommunicator() -> WelcomeOnboardingControllerCommunicator {
        let communicator = WelcomeOnboardingControllerCommunicator(
            view: rootView.onboardingView,
            viewModel: viewModel
        )
        
        communicator.didCompleteTutorial = { [unowned self] in
            self.didComplete?()
        }
        
        return communicator
    }
    
    
    // MARK: - Appearance
    
    private func showNextPage(animated: Bool = true) {
        onboardingCommunicator.showNextPage(animated: animated)
    }
    
}
