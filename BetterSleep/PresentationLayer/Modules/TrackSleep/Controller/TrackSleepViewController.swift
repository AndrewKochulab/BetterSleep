//
//  TrackSleepViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class TrackSleepViewController: ViewController<
    TrackSleepControllerView,
    TrackSleepControllerViewModel
> {
    
    // MARK: - View lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rootView.setNeedsLayout()
        rootView.layoutIfNeeded()
        
        startInitialAnimation()
    }
    
    
    // MARK: - View
    // MARK: Configuration
    
    override func configureView() {
        super.configureView()
        
        rootView.welcomeMessage = "Welcome back to"
    }
}
