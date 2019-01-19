//
//  ChooseSleepMonitoringTypeControllerViewModel.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class ChooseSleepMonitoringTypeControllerViewModel: CreateSmartAlarmPageControllerViewModel {
    
    // MARK: - Properties
    
    override var title: String {
        return "Choose Sleep Monitoring Type"
    }
    
    override var pageDescription: String {
        return "Please select a measure, which will monitor your sleep and estimates the best time to wake up. You could select multiple items to provide the highest estimation."
    }
    
}
