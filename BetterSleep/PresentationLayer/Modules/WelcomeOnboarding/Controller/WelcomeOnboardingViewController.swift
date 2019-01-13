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
    
    
    // MARK: - View lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    // MARK: - View
    // MARK: Configuration
    
    override func configureView() {
        super.configureView()
        
        onboardingCommunicator.setupBehaviour()
        
        rootView.willShowNextPage = { [unowned self] in
            self.showNextPage()
        }
        
        rootView.didSkipTutorial = { [unowned self] in
            
        }
        
        rootView.didFinishTutorial = { [unowned self] in
            
        }
    }
    
    private func configuredOnboardingCommunicator() -> WelcomeOnboardingControllerCommunicator {
        return .init(
            view: rootView.onboardingView,
            viewModel: viewModel
        )
    }
    
    
    // MARK: - Appearance
    
    private func showNextPage(animated: Bool = true) {
        onboardingCommunicator.showNextPage(animated: animated)
    }
    
}
