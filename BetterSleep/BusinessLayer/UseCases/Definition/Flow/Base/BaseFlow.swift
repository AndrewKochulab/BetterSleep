//
//  BaseFlow.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

class BaseFlow<
    Content: FlowContent,
    Assembly: FlowAssembly
>: BaseExtendedCoordinator<Assembly>, Flow {
    
    // MARK: - Properties
    // MARK: Content
    
    let content: Content
    
    
    // MARK: - Initialization
    
    init(
        content: Content,
        assembly: Assembly,
        navigationController: NavigationController
    ) {
        self.content = content
        
        super.init(
            assembly: assembly,
            navigationController: navigationController
        )
    }
    
}
