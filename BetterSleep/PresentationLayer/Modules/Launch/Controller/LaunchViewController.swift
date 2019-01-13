//
//  LaunchViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/7/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class LaunchViewController: ViewController<
    LaunchControllerView,
    LaunchControllerViewModel
> {
    
    // MARK: - Properties
    // MARK: Callback
    
    var didFinishAnimation: EmptyClosure?
    
    
    // MARK: - View lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    // MARK: - View
    // MARK: Configuration
    
    override func configureView() {
        super.configureView()
        
        rootView.animationDuration = viewModel.animationDuration
        rootView.didFinishAnimation = { [unowned self] in
            self.didFinishAnimation?()
        }
    }
}
