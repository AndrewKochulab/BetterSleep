//
//  WelcomeOnboardingControllerCommunicator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation
import paper_onboarding
import SnapKit

final class WelcomeOnboardingControllerCommunicator:
    NSObject,
    PaperOnboardingDataSource,
    PaperOnboardingDelegate,
    UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    // MARK: Content
    
    let view: PaperOnboarding
    let viewModel: WelcomeOnboardingControllerViewModel
    
    private lazy var submitButton: Button = {
        let submitButton = Button()
        submitButton.layer.cornerRadius = 12
        submitButton.layer.masksToBounds = true
        
        submitButton.setAttributedTitle(
            NSAttributedString(
                string: "START",
                attributes: [
                    .foregroundColor : #colorLiteral(red: 0.03749443591, green: 0.07931037992, blue: 0.2180866301, alpha: 1),
                    .font : R.font.sofiaProRegular(size: 22)!
                ]
            ),
            for: .normal
        )
        
        submitButton.backgroundColor = .white
        
        return submitButton
    }()
    
    // MARK: Callbacks
    
    var didCompleteTutorial: EmptyClosure?
    
    
    // MARK: - Initialization
    
    init(
        view: PaperOnboarding,
        viewModel: WelcomeOnboardingControllerViewModel
    ) {
        self.view = view
        self.viewModel = viewModel
    }
    
    
    // MARK: - Appearance
    
    func setupBehaviour() {
        view.dataSource = self
        view.delegate = self
    }
    
    func showNextPage(animated: Bool = true) {
        let nextPagePosition = viewModel.currentPagePosition() + 1
        view.currentIndex(nextPagePosition, animated: animated)
    }
    
    func finishTutorial() {
        viewModel.finishTutorial()
        didCompleteTutorial?()
    }
    
    
    // MARK: - PaperOnboardingDataSource
    
    func onboardingItemsCount() -> Int {
        return viewModel.pagesCount()
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let page = viewModel.page(at: index)
        
        return OnboardingItemInfo(
            informationImage: page.coverImage,
            title: page.title,
            description: page.description,
            pageIcon: page.thumbnailImage,
            color: page.backgroundColor,
            titleColor: .white,
            descriptionColor: .white,
            titleFont: viewModel.titleFont(),
            descriptionFont: viewModel.descriptionFont()
        )
    }
  
    
    // MARK: - PaperOnboardingDelegate
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        viewModel.currentPage = viewModel.page(at: index)
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        guard viewModel.isLastPageVisible() else {
            return
        }
        
        view.gestureRecognizers?.first?.delegate = self
        view.gestureRecognizers?.first?.cancelsTouchesInView = true
        
        item.addSubview(submitButton)
        
        submitButton.snp.makeConstraints { maker in
            maker.width.equalTo(220)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(item.descriptionLabel!.snp.bottom).offset(20)
        }
    }
    
    var enableTapsOnPageControl: Bool {
        return false
    }
    
    
    // MARK: - UIGestureRecognizerDelegate
    
    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldReceive touch: UITouch
    ) -> Bool {
        guard viewModel.isLastPageVisible() else {
            return true
        }
        
        let location = touch.location(in: nil)

        if submitButton.frame.contains(location) {
            finishTutorial()

            return false
        }

        return true
    }
}
