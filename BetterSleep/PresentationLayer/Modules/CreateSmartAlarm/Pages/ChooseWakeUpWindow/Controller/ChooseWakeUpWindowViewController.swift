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
    
    lazy var pageViewModel = configuredViewModel()
    lazy var contentCommunicator = configuredContentCommunicator()
    
    // MARK: View
    
    lazy var pageRootView = configuredRootView()
    
    
    // MARK: - Appearance
    // MARK: Configuration
    
    private func configuredViewModel() -> ChooseWakeUpWindowControllerViewModel {
        return viewModel as! ChooseWakeUpWindowControllerViewModel
    }
    
    private func configuredContentCommunicator() -> ChooseWakeUpWindowControllerCommunicator {
        let communicator = ChooseWakeUpWindowControllerCommunicator(
            tableView: self.pageRootView.tableView,
            viewModel: self.pageViewModel
        )
        
        return communicator
    }
    
    private func configuredRootView() -> ChooseWakeUpWindowControllerView {
        return rootView as! ChooseWakeUpWindowControllerView
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configureView() {
        super.configureView()
        
        pageRootView.configureTableView(communicator: contentCommunicator)
    }
}
