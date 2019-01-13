//
//  WelcomeOnboardingControllerCommunicator.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation
import paper_onboarding

final class WelcomeOnboardingControllerCommunicator:
    PaperOnboardingDataSource,
    PaperOnboardingDelegate {
    
    // MARK: - Properties
    
    let view: PaperOnboarding
    let viewModel: WelcomeOnboardingControllerViewModel
    
    
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
    
    
    // MARK: - PaperOnboardingDataSource
    
    func onboardingItemsCount() -> Int {
        return viewModel.pagesCount()
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let page = viewModel.page(at: index)
        
        return OnboardingItemInfo(
            informationImage: UIImage(named: page.imagePath) ?? UIImage(),
            title: page.title,
            description: page.description,
            pageIcon: UIImage(named: page.iconPath) ?? UIImage(),
            color: page.backgroundColorType.color,
            titleColor: .white,
            descriptionColor: .white,
            titleFont: UIFont.systemFont(ofSize: 36), //Font.Nunito.bold.of(size: 36) ?? UIFont.boldSystemFont(ofSize: 36.0),
            descriptionFont: UIFont.systemFont(ofSize: 14)// Font.OpenSans.regular.of(size: 14) ?? UIFont.systemFont(ofSize: 14.0)
        )
    }
  
    
    // MARK: - PaperOnboardingDelegate
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        viewModel.currentPage = viewModel.page(at: index)
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    var enableTapsOnPageControl: Bool {
        return false
    }
}
