//
//  ChooseWakeUpTimeViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class ChooseWakeUpTimeViewController: CreateSmartAlarmPageViewController {

    // MARK: - Properties
    // MARK: Content
    
    lazy var pageViewModel = configuredViewModel()
   
    // MARK: View
    
    lazy var pageRootView = configuredRootView()
    
    
    // MARK: - Appearance
    // MARK: Configuration
    
    private func configuredViewModel() -> ChooseWakeUpTimeControllerViewModel {
        return viewModel as! ChooseWakeUpTimeControllerViewModel
    }
    
    private func configuredRootView() -> ChooseWakeUpTimeControllerView {
        return rootView as! ChooseWakeUpTimeControllerView
    }
}
