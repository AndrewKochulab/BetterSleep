//
//  CreateSmartAlarmPageViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

class CreateSmartAlarmPageViewController: ViewController<
    CreateSmartAlarmPageControllerView,
    CreateSmartAlarmPageControllerViewModel
> {
    
    // MARK: - Initialization
    
    init(
        pageView: CreateSmartAlarmPageControllerView,
        pageViewModel: CreateSmartAlarmPageControllerViewModel
    ) {
        super.init(view: pageView, viewModel: pageViewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil // No needed
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configureView() {
        super.configureView()
        
        rootView.pageDescription = viewModel.pageDescription
        
    }
}
