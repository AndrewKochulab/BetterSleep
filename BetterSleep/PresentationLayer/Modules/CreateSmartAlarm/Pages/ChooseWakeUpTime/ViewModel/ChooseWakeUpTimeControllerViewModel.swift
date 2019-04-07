//
//  ChooseWakeUpTimeControllerViewModel.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class ChooseWakeUpTimeControllerViewModel: CreateSmartAlarmPageControllerViewModel {
    
    // MARK: - Properties
    
    override var title: String {
        return "Choose Wake Up Time"
    }
    
    override var pageDescription: String {
        return "Simply drag left (hour) and right (minute) bars to define the latest time to wake up."
    }
    
    override var isBackVisible: Bool {
        return false
    }
    
}
