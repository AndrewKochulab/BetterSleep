//
//  ObjectNotifiable.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

protocol ObjectNotifiable: Notifiable {
    
    // MARK: - Types
    
    associatedtype Model
    
    
    // MARK: - Properties
    
    var object: Model { get }
    
}
