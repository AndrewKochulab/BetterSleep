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
    
    lazy var pageViewModel: ChooseSleepMonitoringTypeControllerViewModel = {
        return viewModel as! ChooseSleepMonitoringTypeControllerViewModel
    }()
    
    // MARK: View
    
    lazy var pageRootView: ChooseSleepMonitoringTypeControllerView = {
        return rootView as! ChooseSleepMonitoringTypeControllerView
    }()
    
}
