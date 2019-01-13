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
    // MARK: Callbacks
    
    var willShowNextPage: EmptyClosure?
    var didSkipTutorial: EmptyClosure?
    var didFinishTutorial: EmptyClosure?
    
    // MARK: Views
    
    lazy var onboardingView = configuredOnboardingView()
    
    private lazy var nextPageButton = configuredNextPageButton()
    private lazy var finishTutorialButton = configuredFinishTutorialButton()
    private lazy var skipTutorialButton = configuredSkipTutorialButton()
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachOnboardingView()
        attachNextPageButton()
        attachFinishTutorialButton()
        attachSkipTutorialButton()
    }
    
    private func configuredOnboardingView() -> PaperOnboarding {
        return PaperOnboarding()
    }
    
    private func configuredNextPageButton() -> Button {
        let button = Button()
        button.didTouchUpInside = { _ in
            
        }
        
        return button
    }
    
    private func configuredFinishTutorialButton() -> Button {
        let button = Button()
        button.didTouchUpInside = { _ in
            
        }
        
        return button
    }
    
    private func configuredSkipTutorialButton() -> Button {
        let button = Button()
        button.didTouchUpInside = { _ in
            
        }
        
        return button
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
    
    private func attachNextPageButton() {
        containerView.addSubview(nextPageButton)
        
        nextPageButton.snp.makeConstraints { maker in
            
        }
    }
    
    private func attachFinishTutorialButton() {
        containerView.addSubview(finishTutorialButton)
        
        finishTutorialButton.snp.makeConstraints { maker in
            
        }
    }
    
    private func attachSkipTutorialButton() {
        containerView.addSubview(skipTutorialButton)
        
        skipTutorialButton.snp.makeConstraints { maker in
            
        }
    }
}
