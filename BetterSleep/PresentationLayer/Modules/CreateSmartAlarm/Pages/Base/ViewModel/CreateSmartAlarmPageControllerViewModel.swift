//
//  CreateSmartAlarmPageControllerViewModel.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

class CreateSmartAlarmPageControllerViewModel: ControllerViewModel {
    
    // MARK: - Properties
    
    var title: String {
        return ""
    }
    
    var pageDescription: String {
        return ""
    }
    
    var submitTitle: String {
        return "NEXT"
    }
    
    var isBackVisible: Bool {
        return true
    }
    
    var isSubmitVisible: Bool {
        return true
    }
    
    var isSubmitEnabled: Bool {
        return true
    }
    
}
