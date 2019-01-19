//
//  Control.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/19/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

class Control: UIControl {
    
    // MARK: - Types
    
    typealias DidTouchUpInside = () -> Void
    
    // MARK: - Properties
    
    var didTouchUpInside: DidTouchUpInside? {
        didSet {
            attachTouchUpInsideEvent()
        }
    }
    
    
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
        backgroundColor = .clear
    }
    
    // MARK: Attachments
    
    private func attachTouchUpInsideEvent() {
        addTarget(self, action: #selector(touchedUpInside), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc
    private func touchedUpInside() {
        didTouchUpInside?()
    }
}
