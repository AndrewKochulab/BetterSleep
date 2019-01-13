//
//  ControllerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import UIKit
import SnapKit

class ControllerView: UIView {
    
    // MARK: - Properties
    
    lazy var containerView = configuredContainerView()
    
    
    // MARK: - Initialization
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil // No needed
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
    
    // MARK: Animation
    
    func startInitialAnimation() {
        
    }
    
    func stopInitialAnimation() {
        
    }
}
