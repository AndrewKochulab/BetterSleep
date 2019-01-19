//
//  TableViewCell.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/19/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Properties
    // MARK: TableView
    
    lazy var containerView = configuredContainerView()
    
    
    // MARK: - Initialization
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil // No neede
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    func configure() {
        backgroundColor = .clear
        
        attachContainerView()
    }
    
    func configuredContainerView() -> View {
        return .init()
    }
    
    // MARK: Attachments
    
    func attachContainerView() {
        addSubview(containerView)
        
        containerView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}
