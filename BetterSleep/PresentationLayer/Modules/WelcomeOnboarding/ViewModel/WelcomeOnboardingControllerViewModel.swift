//
//  WelcomeOnboardingControllerViewModel.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class WelcomeOnboardingControllerViewModel: ControllerViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private lazy var pages = configuredPages()
    lazy var currentPage = page(at: 0)
    
    
    // MARK: - Appearance
    
    private func configuredPages() -> [WelcomeOnboardingPage] {
        return [
            WelcomeOnboardingPage(
                title: "Hotels",
                description: "All hotels and hostels are sorted by hospitality rating",
                imagePath: "",
                iconPath: "",
                backgroundColorType: .niagara
            ),
            WelcomeOnboardingPage(
                title: "Banks",
                description: "We carefully verify all banks before add them into the app",
                imagePath: "",
                iconPath: "",
                backgroundColorType: .curiousBlue
            ),
            WelcomeOnboardingPage(
                title: "Stores",
                description: "All local stores are categorized for your convenience",
                imagePath: "",
                iconPath: "",
                backgroundColorType: .madison
            )
        ]
    }
    
    func skipTutorial() {
        
    }
    
    func finishTutorial() {
        
    }
    
    func page(at index: Int) -> WelcomeOnboardingPage {
        return pages[index]
    }
    
    func pagesCount() -> Int {
        return pages.count
    }
    
    func currentPagePosition() -> Int {
        return pages.firstIndex(of: currentPage) ?? 0
    }
}
