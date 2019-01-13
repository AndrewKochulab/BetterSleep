//
//  WelcomeViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

final class WelcomeViewController: ViewController<
    WelcomeControllerView,
    WelcomeControllerViewModel
> {
    
    // MARK: - Properties
    // MARK: Callbacks
    
    var didStartExploringOnboarding: EmptyClosure?

    
    // MARK: - View lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rootView.setNeedsLayout()
        rootView.layoutIfNeeded()
    }
    

    // MARK: - View
    // MARK: Configuration
    
    override func configureView() {
        super.configureView()
        
        rootView.welcomeMessage = "Welcome to"
        
        rootView.didStartTouchUpInside = { [unowned self] _ in
            self.stopInitialAnimation()
            self.didStartExploringOnboarding?()
        }
    }
}
