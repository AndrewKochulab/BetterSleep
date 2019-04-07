//
//  RequestMonitoringPermissionsViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/19/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class RequestMonitoringPermissionsViewController: CreateSmartAlarmPageViewController {
    
    // MARK: - Properties
    // MARK: Content
    
    lazy var pageViewModel = configuredViewModel()
    
    // MARK: View
    
    lazy var pageRootView = configuredRootView()
    
    
    // MARK: - Appearance
    // MARK: Configuration
    
    private func configuredViewModel() -> RequestMonitoringPermissionsControllerViewModel {
        return viewModel as! RequestMonitoringPermissionsControllerViewModel
    }
    
    private func configuredRootView() -> RequestMonitoringPermissionsControllerView {
        return rootView as! RequestMonitoringPermissionsControllerView
    }
}
