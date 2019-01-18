//
//  CreateSmartAlarmPagerFooterView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class CreateSmartAlarmPagerFooterView: View {
    
    // MARK: - Properties
    // MARK: Content
    
    var submitTitle: String {
        get {
            return submitButton.currentTitle ?? ""
        }
        set {
            submitButton.setAttributedTitle(
                NSAttributedString(
                    string: newValue,
                    attributes: [
                        .foregroundColor : UIColor.white,
                        .font : R.font.sofiaProMedium(size: 20)!
                    ]
                ),
                for: .normal
            )
        }
    }
    
    var isSubmitVisible: Bool {
        get {
            return !submitButton.isHidden
        }
        set {
            submitButton.isHidden = !newValue
        }
    }
    
    var isSubmitEnabled: Bool {
        get {
            return submitButton.isEnabled
        }
        set {
            submitButton.isEnabled = newValue
        }
    }
    
    // MARK: Callbacks
    
    var didPressSubmit: EmptyClosure?
    
    // MARK: Views
    
    private lazy var submitButton = configuredSubmitButton()
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachSubmitButton()
    }
    
    private func configuredSubmitButton() -> Button {
        let button = Button()
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(red: 22.0 / 255.0, green: 160.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
        button.contentEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 80,
            bottom: 0,
            right: 80
        )
        
        button.didTouchUpInside = { [unowned self] _ in
            self.didPressSubmit?()
        }
        
        return button
    }
    
    // MARK: Attachments
    
    private func attachSubmitButton() {
        addSubview(submitButton)
        
        submitButton.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.height.equalTo(50)
        }
    }
}
