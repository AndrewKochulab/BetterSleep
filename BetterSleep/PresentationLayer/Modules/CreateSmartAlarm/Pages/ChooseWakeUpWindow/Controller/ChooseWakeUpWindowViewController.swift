//
//  ChooseWakeUpWindowViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class ChooseWakeUpWindowViewController: CreateSmartAlarmPageViewController {
    
    // MARK: - Properties
    // MARK: Content
    
    lazy var pageViewModel: ChooseWakeUpWindowControllerViewModel = {
        return viewModel as! ChooseWakeUpWindowControllerViewModel
    }()
    
    // MARK: View
    
    lazy var pageRootView: ChooseWakeUpWindowControllerView = {
        return rootView as! ChooseWakeUpWindowControllerView
    }()
    
}
