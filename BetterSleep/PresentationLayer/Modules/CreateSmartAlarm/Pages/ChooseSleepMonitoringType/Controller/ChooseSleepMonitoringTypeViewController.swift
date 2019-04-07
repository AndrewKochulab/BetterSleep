//
//  ChooseSleepMonitoringTypeViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class ChooseSleepMonitoringTypeViewController: CreateSmartAlarmPageViewController {
    
    // MARK: - Properties
    // MARK: Content
    
    lazy var pageViewModel = configuredViewModel()
    
    // MARK: View
    
    lazy var pageRootView = configuredRootView()
    
    
    // MARK: - Appearance
    // MARK: Configuration
    
    private func configuredViewModel() -> ChooseSleepMonitoringTypeControllerViewModel {
        return viewModel as! ChooseSleepMonitoringTypeControllerViewModel
    }
    
    private func configuredRootView() -> ChooseSleepMonitoringTypeControllerView {
        return rootView as! ChooseSleepMonitoringTypeControllerView
    }
    
}
