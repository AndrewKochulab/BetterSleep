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
    
    lazy var pageViewModel: ChooseWakeUpTimeControllerViewModel = {
        return viewModel as! ChooseWakeUpTimeControllerViewModel
    }()
    
    // MARK: View
    
    lazy var pageRootView: ChooseWakeUpTimeControllerView = {
        return rootView as! ChooseWakeUpTimeControllerView
    }()
    
}
