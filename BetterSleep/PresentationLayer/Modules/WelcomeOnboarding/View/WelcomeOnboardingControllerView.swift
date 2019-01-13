//
//  WelcomeOnboardingControllerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit
import paper_onboarding

final class WelcomeOnboardingControllerView: ControllerView {
    
    // MARK: - Properties
    // MARK: Views
    
    lazy var onboardingView = configuredOnboardingView()
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachOnboardingView()
    }
    
    private func configuredOnboardingView() -> PaperOnboarding {
        return PaperOnboarding()
    }
    
    func setup(
        dataSource: PaperOnboardingDataSource & AnyObject,
        delegate: PaperOnboardingDelegate & AnyObject
    ) {
        onboardingView.dataSource = dataSource
        onboardingView.delegate = delegate
    }
    
    // MARK: Attachments
    
    private func attachOnboardingView() {
        containerView.addSubview(onboardingView)
        
        onboardingView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}
