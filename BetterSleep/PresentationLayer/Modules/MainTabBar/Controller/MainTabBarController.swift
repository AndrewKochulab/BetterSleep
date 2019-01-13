//
//  MainTabBarController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit
import ESTabBarController_swift

final class MainTabBarController: ESTabBarController {
    
    // MARK: - Types
    
    typealias ViewModel = MainTabBarControllerViewModel
    
    
    // MARK: - Properties
    // MARK: Content
    
    let viewModel: ViewModel
    
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil // No needed
    }
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    
    // MARK: - Appearance
    
    func configure(
        with controllers: [UIViewController]
    ) {
        self.viewControllers = controllers
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    private func configureView() {
        tabBar.backgroundImage = R.image.tabBarBackground()
    }
}
