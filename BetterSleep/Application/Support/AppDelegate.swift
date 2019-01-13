//
//  AppDelegate.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/23/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Appearance

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        App.configure(using: application)
        App.coordinator.start(animated: false)
        
        let dip = DIPDependencyContainer.init()
        dip.registerDependency(scope: .unique) {
            UIViewController()
        }
        
        let v: UIViewController = dip.resolve()
        
        return true
    }
}
