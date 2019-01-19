//
//  ChooseWakeUpWindowControllerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class ChooseWakeUpWindowControllerView: CreateSmartAlarmPageControllerView {
    
    // MARK: - Properties
    // MARK: Views
    
    lazy var tableView = configuredTableView()
    
    
    // MARK: - Appearance
    
    func configureTableView(
        communicator: UITableViewDataSource & UITableViewDelegate
    ) {
        tableView.dataSource = communicator
        tableView.delegate = communicator
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachTableView()
    }
    
    private func configuredTableView() -> TableView {
        let tableView = TableView(frame: .zero, style: .plain)
        tableView.register(WakeUpWindowNameTableViewCell.self)
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        return tableView
    }
    
    // MARK: Attachments
    
    private func attachTableView() {
        contentView.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.top.bottom.equalToSuperview()
            maker.left.right.equalToSuperview().inset(20)
        }
    }
    
    // MARK: Animation
    
    override func startInitialAnimation() {
        super.startInitialAnimation()
        
        tableView.fadeIn(duration: 0.5)
        descriptionLabel.fadeIn(duration: 0.5, delay: 0.3)
    }
}
