//
//  Button.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    // MARK: - Properties
    
    var didTouchUpInside: DidTouchUpInside? {
        didSet {
            attachTouchUpInsideEvent()
        }
    }
    

    // MARK: - UI
    // MARK: Attachments
    
    private func attachTouchUpInsideEvent() {
        addTarget(self, action: #selector(touchedUpInside), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc
    private func touchedUpInside() {
        didTouchUpInside?(self)
    }
}
