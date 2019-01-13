//
//  AppDefinition.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/24/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import UIKit

let App: Application = Application(
    coordinator: MainAppCoordinator(
        assembly: .init(),
        navigationController: NavigationController(
            rootViewController: UIViewController(nibName: nil, bundle: nil)
        )
    ),
    configuration: MainAppConfiguration()
)
