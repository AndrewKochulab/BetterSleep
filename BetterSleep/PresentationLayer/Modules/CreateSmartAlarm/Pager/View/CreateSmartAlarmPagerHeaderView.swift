//
//  CreateSmartAlarmPagerHeaderView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class CreateSmartAlarmPagerHeaderView: View {
    
    // MARK: - Properties
    // MARK: Content
    
    var title: String {
        get {
            return titleLabel.text ?? ""
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var isBackVisible: Bool {
        get {
            return !backButton.isHidden
        }
        set {
            backButton.isHidden = newValue
        }
    }
    
    // MARK: Callbacks
    
    var didPressBack: EmptyClosure?
    
    // MARK: Views
    
    private lazy var backButton = configuredBackButton()
    private lazy var titleLabel = configuredTitleLabel()
    

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil // No needed
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    func configure() {
        attachBackButton()
        attachTitleLabel()
    }
    
    private func configuredBackButton() -> Button {
        let button = Button()
        
        button.didTouchUpInside = { [unowned self] _ in
            self.didPressBack?()
        }
        
        return button
    }
    
    private func configuredTitleLabel() -> Label {
        let label = Label()
        label.font = R.font.sofiaProMedium(size: 22)
        label.textColor = #colorLiteral(red: 0.8789252639, green: 0.9116950631, blue: 0.924718082, alpha: 1)
        label.textAlignment = .center
        
        return label
    }
    
    // MARK: Attachments
    
    private func attachBackButton() {
        addSubview(backButton)
        
        backButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.left.equalToSuperview()
            maker.width.equalTo(80)
        }
    }
    
    private func attachTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview().inset(20)
            maker.right.equalToSuperview().inset(20)
            maker.bottom.equalToSuperview()
        }
    }
}
