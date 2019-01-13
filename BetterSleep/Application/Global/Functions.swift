//
//  GlobalFunctions.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

func printMessage(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    if App.configuration.debugEnabled {
        print(items, separator: separator, terminator: terminator)
    }
}

func notImplementedFatalError() -> Never {
    fatalError("Please implement this method '\(#function)'.")
}
