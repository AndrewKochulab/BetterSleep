//
//  ChooseWakeUpWindowControllerViewModel.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class ChooseWakeUpWindowControllerViewModel: CreateSmartAlarmPageControllerViewModel {
    
    // MARK: - Properties
    
    override var title: String {
        return "Choose Wake Up Window"
    }
    
    override var pageDescription: String {
        return "Please choose your alarm window and we will wake up you in the best possible moment, during your current sleep cycle."
    }
    
    private lazy var windows = WakeUpWindow.Value.allCases
    var selectedWindow: WakeUpWindow.Value?
    
    
    // MARK: - Appearance
    
    func windowsCount() -> Int {
        return windows.count
    }
    
    func window(at index: Int) -> WakeUpWindow.Value {
        return windows[index]
    }
    
}
