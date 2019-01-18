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
    // MARK: Set
    
    func set<Controller>(
        controller: Controller,
        animated: Bool = true,
        configuration: ((Controller) -> Void)? = nil,
        completion: @escaping (Controller) -> Void
    ) where Controller: UIViewController {
        configuration?(controller)
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            completion(controller)
        }
        
        setViewControllers([controller], animated: animated)
        
        CATransaction.commit()
    }
    
    func set<Controller>(
        controller: Controller,
        animated: Bool = true,
        configuration: ((Controller) -> Void)? = nil,
        completion: @escaping () -> Void
    ) where Controller: UIViewController {
        set(
            controller: controller,
            animated: animated,
            configuration: configuration
        ) { viewController in
            completion()
        }
    }
    
    // MARK: Push
    
    func push<Controller>(
        controller: Controller,
        animated: Bool = true,
        configuration: ((Controller) -> Void)? = nil,
        completion: @escaping (Controller) -> Void
    ) where Controller: UIViewController {
        configuration?(controller)
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            completion(controller)
        }
        
        pushViewController(controller, animated: animated)
        
        CATransaction.commit()
    }
    
    func push<Controller>(
        controller: Controller,
        animated: Bool = true,
        configuration: ((Controller) -> Void)? = nil,
        completion: @escaping () -> Void
    ) where Controller: UIViewController {
        push(
            controller: controller,
            animated: animated,
            configuration: configuration
        ) { _ in
            completion()
        }
    }
    
    // MARK: Present
    
    func present<Controller>(
        controller: Controller,
        animated: Bool = true,
        configuration: ((Controller) -> Void)? = nil,
        completion: @escaping (Controller) -> Void
    ) where Controller: UIViewController {
        configuration?(controller)
        
        present(controller, animated: animated) {
            completion(controller)
        }
    }
    
    func present<Controller>(
        controller: Controller,
        animated: Bool = true,
        configuration: ((Controller) -> Void)? = nil,
        completion: @escaping () -> Void
    ) where Controller: UIViewController {
        present(
            controller: controller,
            animated: animated,
            configuration: configuration
        ) { _ in
            completion()
        }
    }
    
    // MARK: Pop
    
    func pop(
        animated: Bool = true,
        completion: @escaping () -> Void
    ) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        
        popViewController(animated: animated)
        
        CATransaction.commit()
    }
}

extension ViewController {
    
    // MARK: - Properties
    
    var navController: NavigationController? {
        return navigationController as? NavigationController
    }
    
}
