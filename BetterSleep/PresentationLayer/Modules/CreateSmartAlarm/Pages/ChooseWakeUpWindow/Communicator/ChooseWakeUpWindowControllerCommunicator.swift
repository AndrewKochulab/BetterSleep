//
//  ChooseWakeUpWindowControllerCommunicator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/19/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class ChooseWakeUpWindowControllerCommunicator:
    NSObject,
    UITableViewDataSource,
    UITableViewDelegate {
    
    // MARK: - Properties
    
    let tableView: UITableView
    let viewModel: ChooseWakeUpWindowControllerViewModel
    
    
    // MARK: - Initialization
    
    init(
        tableView: UITableView,
        viewModel: ChooseWakeUpWindowControllerViewModel
    ) {
        self.tableView = tableView
        self.viewModel = viewModel
        
        super.init()
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.windowsCount()
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: WakeUpWindowNameTableViewCell = tableView.dequeueCell(at: indexPath)
        
        let window = viewModel.window(at: indexPath.row)
        cell.title = window.name
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 60
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        cell.fadeIn(duration: 0.3)
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        viewModel.selectedWindow = viewModel.window(at: indexPath.row)
    }
}
