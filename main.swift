//
//  main.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

autoreleasepool {
    _ = UIApplicationMain(
        CommandLine.argc,
        CommandLine.unsafeArgv,
        nil,
        NSStringFromClass(Application.self)
    )
}

let App = UIApplication.shared.delegate as! Application
