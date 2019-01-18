//
//  ChooseAlarmTimePickerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/18/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit
import AGCircularPicker

final class ChooseAlarmTimePickerView:
    View,
    AGCircularPickerDelegate {
    
    // MARK: - Types
    
    typealias DidChange = (_ alarmTime: AlarmTime, _ currentComponent: AlarmTime.Component, _ color: UIColor) -> Void
    
    
    // MARK: - Properties
    // MARK: Content
    
    private(set) var alarmTime: AlarmTime
    private lazy var components = AlarmTime.Component.allCases
    
    // MARK: Callbacks
    
    var didChange: DidChange?
    
    // MARK: Views
    
    private lazy var pickerView = configuredPickerView()

    
    // MARK: - Initialization
    
    init(alarmTime: AlarmTime = .init()) {
        self.alarmTime = alarmTime
        
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil // No needed
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachPickerView()
    }
    
    private func configuredPickerView() -> AGCircularPicker {
        let pickerView = AGCircularPicker()
        pickerView.delegate = self
        
        pickerView.options = components.compactMap { component in
            let titleOption = AGCircularPickerTitleOption(
                title: component.name,
                titleFont: R.font.sofiaProLight(size: 24)!
            )
            
            let valueOption = AGCircularPickerValueOption(
                minValue: component.minValue(),
                maxValue: component.maxValue(),
                rounds: component.rounds(),
                initialValue: component.initialValue()
            )
            
            let colorOption = AGCircularPickerColorOption(
                gradientColors: component.gradientColors(),
                gradientAngle: component.gradientAngle()
            )
            
            return AGCircularPickerOption(
                valueOption: valueOption,
                titleOption: titleOption,
                colorOption: colorOption
            )
        }
        
        return pickerView
    }
    
    // MARK: Attachments
    
    private func attachPickerView() {
        addSubview(pickerView)
        
        pickerView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
 
    // MARK: - AGCircularPickerDelegate
    
    func didChangeValues(
        _ values: Array<AGColorValue>,
        selectedIndex: Int
    ) {
        let components = values.compactMap {
            $0.value
        }
        
        guard components.count == AlarmTime.Component.allCases.count else {
            return
        }
        
        guard let currentComponent = AlarmTime.Component(rawValue: selectedIndex) else {
            return
        }
        
        alarmTime = .init(hour: components[0], minute: components[1])
        didChange?(alarmTime, currentComponent, values[selectedIndex].color)
    }
}

fileprivate extension AlarmTime.Component {
    func gradientColors() -> [UIColor] {
        switch self {
        case .hour:
            return [
                UIColor(red: 0, green: 237, blue: 233),
                UIColor(red: 0, green: 135, blue: 217),
                UIColor(red: 138, green: 28, blue: 195)
            ]
            
        case .minute:
            return [
                UIColor(red: 255, green: 141, blue: 0),
                UIColor(red: 255, green: 0, blue: 88),
                UIColor(red: 146, green: 0, blue: 132)
            ]
        }
    }
    
    func gradientAngle() -> Int {
        switch self {
        case .hour:
            return 120
            
        case .minute:
            return -120
        }
    }
    
    func minValue() -> Int {
        return 0
    }
    
    func maxValue() -> Int {
        switch self {
        case .hour:
            return 23
            
        case .minute:
            return 59
        }
    }
    
    func rounds() -> Int {
        switch self {
        case .hour:
            return 2
            
        case .minute:
            return 1
        }
    }
    
    func initialValue() -> Int {
        switch self {
        case .hour:
            return 13
            
        case .minute:
            return 0
        }
    }
}
