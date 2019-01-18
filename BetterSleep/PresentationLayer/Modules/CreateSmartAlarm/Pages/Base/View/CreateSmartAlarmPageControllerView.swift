//
//  CreateSmartAlarmPageControllerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

class CreateSmartAlarmPageControllerView: ControllerView {
    
    // MARK: - Properties
    // MARK: Content
    
    var pageDescription: String {
        get {
            return descriptionLabel.text ?? ""
        }
        set {
            descriptionLabel.text = newValue
        }
    }
    
    // MARK: Views
    
    lazy var contentView = configuredContentView()
    lazy var descriptionLabel = configuredDescriptionLabel()
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachContentView()
        attachDescriptionLabel()
    }
    
    func configuredContentView() -> View {
        return .init()
    }
    
    func configuredDescriptionLabel() -> Label {
        let label = Label()
        label.font = R.font.sofiaProRegular(size: 16)
        label.textColor = #colorLiteral(red: 0.8789252639, green: 0.9116950631, blue: 0.924718082, alpha: 1)
        label.textAlignment = .center
        
        return label
    }
    
    // MARK: Attachments
    
    private func attachContentView() {
        containerView.addSubview(contentView)
        
        contentView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(16)
            maker.left.equalToSuperview().inset(12)
            maker.right.equalToSuperview().inset(12)
        }
    }
    
    private func attachDescriptionLabel() {
        containerView.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(contentView.snp.bottom).offset(16)
            maker.left.equalToSuperview().inset(12)
            maker.right.equalToSuperview().inset(12)
            maker.bottom.equalToSuperview().inset(16)
            maker.height.equalTo(100)
        }
    }
}
