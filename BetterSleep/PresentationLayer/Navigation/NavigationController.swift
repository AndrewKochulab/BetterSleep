//
//  NavigationController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/24/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    // MARK: - Appearance
    
    func set<View, ViewModel, Controller>(
        viewController: Controller,
        animated: Bool = true,
        configuration: ((Controller) -> Void)? = nil,
        completion: @escaping (Controller) -> Void
    ) where Controller: ViewController<View, ViewModel> {
        configuration?(viewController)
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            completion(viewController)
        }
        
        setViewControllers([viewController], animated: animated)
        
        CATransaction.commit()
    }
    
    func set<View, ViewModel, Controller>(
        viewController: Controller,
        animated: Bool = true,
        configuration: ((Controller) -> Void)? = nil,
        completion: @escaping () -> Void
    ) where Controller: ViewController<View, ViewModel> {
        set(
            viewController: viewController,
            animated: animated,
            configuration: configuration
        ) { viewController in
            completion()
        }
    }
    
}

extension ViewController {
    
    // MARK: - Properties
    
    var navController: NavigationController? {
        return navigationController as? NavigationController
    }
    
}
