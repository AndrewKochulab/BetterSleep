//
//  WelcomeOnboardingControllerViewModel.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/6/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class WelcomeOnboardingControllerViewModel: ControllerViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private lazy var pages = configuredPages()
    lazy var currentPage = page(at: 0)
    
    
    // MARK: - Appearance
    
    private func configuredPages() -> [WelcomeOnboardingPage] {
//        let initialPage = WelcomeOnboardingPage(
//            title: "Why will I sleep better?",
//            description: "BetterSleep wakes you up when it's best for you.",
//            imagePath: <#T##String#>,
//            iconPath: <#T##String#>,
//            backgroundColor: UIColor(red: 0.17, green: 0.24, blue: 0.31, alpha: 1)
//        )
        
        return []
        
        
//        return [
//            WelcomeOnboardingPage(
//                title: "Hotels",
//                description: "All hotels and hostels are sorted by hospitality rating",
//                imagePath: "",
//                iconPath: "",
//                backgroundColorType: .niagara
//            ),
//            WelcomeOnboardingPage(
//                title: "Banks",
//                description: "We carefully verify all banks before add them into the app",
//                imagePath: "",
//                iconPath: "",
//                backgroundColorType: .curiousBlue
//            ),
//            WelcomeOnboardingPage(
//                title: "Stores",
//                description: "All local stores are categorized for your convenience",
//                imagePath: "",
//                iconPath: "",
//                backgroundColorType: .madison
//            )
//        ]
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
