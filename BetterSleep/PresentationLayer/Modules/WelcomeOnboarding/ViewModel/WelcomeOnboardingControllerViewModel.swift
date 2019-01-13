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
        let initialPage = WelcomeOnboardingPage(
            title: "Why will I sleep better?",
            description: "BetterSleep wakes you up when it's best for you.",
            coverImage: R.image.onboardingFirstPageBackground()!,
            thumbnailImage: UIImage(),
            backgroundColor: #colorLiteral(red: 0.02501644194, green: 0.1702722311, blue: 0.2701003551, alpha: 1)
        )
        
        let soundsAnalysisPage = WelcomeOnboardingPage(
            title: "Sound analysis",
            description: "The application tracks your sleep phases using a microphone.\nBetterSleep estimates the quality of your sleep, duration of light / deep sleep, etc.",
            coverImage: R.image.onboardingSecondPageBackground()!,
            thumbnailImage: UIImage(),
            backgroundColor: #colorLiteral(red: 0.01116960682, green: 0.07303222269, blue: 0.1355648935, alpha: 1)
        )
        
        let gyroscopeAnalysisPage = WelcomeOnboardingPage(
            title: "Gyroscope analysis",
            description: "BetterSleep monitor your movements while you sleeping in light and deep phases.",
            coverImage: R.image.onboardingThirdPageBackground()!,
            thumbnailImage: UIImage(),
            backgroundColor: #colorLiteral(red: 0, green: 0.05882352963, blue: 0.1019607857, alpha: 1)
        )
        
        let dayCyclePage = WelcomeOnboardingPage(
            title: "Explore your day cycle",
            description: "The application will help you find the best phase of waking up based on your activities throughout the day: workout, usage a lot of caffeine or alcohol, smoking, late eating, have a stressful day, etc.",
            coverImage: R.image.onboardingFourthPageBackground()!,
            thumbnailImage: UIImage(),
            backgroundColor: #colorLiteral(red: 0.1170641407, green: 0.1736399829, blue: 0.2228212059, alpha: 1)
        )
        
        let wakeUpWindowPage = WelcomeOnboardingPage(
            title: "Up to 30 minutes Wake Up Window",
            description: "You simply choose the time in which you want to wake up and BetterSleep will wake you up slowly and quietly in at the best point in a 30-minute window.",
            coverImage: R.image.onboardingFifthPageBackground()!,
            thumbnailImage: UIImage(),
            backgroundColor: #colorLiteral(red: 0.228230238, green: 0.1934443712, blue: 0.1827996075, alpha: 1)
        )
        
        let finalPage = WelcomeOnboardingPage(
            title: "Tap to improve your sleep quality",
            description: "",
            coverImage: R.image.onboardingFinalPageBackground()!,
            thumbnailImage: UIImage(),
            backgroundColor: #colorLiteral(red: 0.03749443591, green: 0.07931037992, blue: 0.2180866301, alpha: 1)
        )
        
        return [
            initialPage,
            soundsAnalysisPage,
            gyroscopeAnalysisPage,
            dayCyclePage,
            wakeUpWindowPage,
            finalPage
        ]
    }
    
    func isLastPageVisible() -> Bool {
        return pages.firstIndex(of: currentPage) == pagesCount() - 1
    }
    
    func titleFont() -> UIFont {
        return R.font.sofiaProSemiBold(size: 24)!
    }
    
    func descriptionFont() -> UIFont {
        return R.font.sofiaProLight(size: 18)!
    }
    
    func finishTutorial() {
        // FIXME: Save tutorial complete
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
