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
    
    func set<Controller>(
        viewController: Controller,
        animated: Bool = true,
        configuration: ((Controller) -> Void)? = nil,
        completion: @escaping (Controller) -> Void
    ) where Controller: UIViewController {
        configuration?(viewController)
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            completion(viewController)
        }
        
        setViewControllers([viewController], animated: animated)
        
        CATransaction.commit()
    }
    
    func set<Controller>(
        viewController: Controller,
        animated: Bool = true,
        configuration: ((Controller) -> Void)? = nil,
        completion: @escaping () -> Void
    ) where Controller: UIViewController {
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
