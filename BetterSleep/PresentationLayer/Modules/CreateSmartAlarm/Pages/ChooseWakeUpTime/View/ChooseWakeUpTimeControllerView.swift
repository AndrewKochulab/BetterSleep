//
//  ChooseWakeUpTimeControllerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class ChooseWakeUpTimeControllerView: CreateSmartAlarmPageControllerView {
    
    // MARK: - Properties
    // MARK: Views
    
    private lazy var timeLabel = configuredTimeLabel()
    private lazy var pickerView = configuredPickerView()
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachTimeLabel()
        attachPickerView()
    }
    
    private func configuredTimeLabel() -> Label {
        let label = Label()
        label.textAlignment = .center
        
        return label
    }
    
    private func configuredPickerView() -> ChooseAlarmTimePickerView {
        let pickerView = ChooseAlarmTimePickerView()
        pickerView.didChange = { [unowned self] alarmTime, currentComponent, currentComponentColor in
            var alarmTime = alarmTime
            
            self.updateTime(
                alarmTime.representation(),
                component: currentComponent,
                color: currentComponentColor
            )
        }
        
        return pickerView
    }
    
    // MARK: Attachments
    
    private func attachTimeLabel() {
        contentView.addSubview(timeLabel)
        
        timeLabel.snp.makeConstraints { maker in
            maker.top.left.right.equalToSuperview()
        }
    }
    
    private func attachPickerView() {
        contentView.addSubview(pickerView)
        
        pickerView.snp.makeConstraints { maker in
            maker.top.equalTo(timeLabel.snp.bottom)
            maker.left.right.equalToSuperview().inset(24)
            maker.bottom.equalToSuperview()
        }
    }
    
    // MARK: Updates
    
    private func updateTime(
        _ alarmRepresentation: String,
        component: AlarmTime.Component,
        color: UIColor
    ) {
        let attributedString = NSMutableAttributedString(
            string: alarmRepresentation,
            attributes: [
                .foregroundColor : UIColor.white.withAlphaComponent(0.8),
                .font : R.font.sofiaProMedium(size: 32)!
            ]
        )
        
        let index = component.rawValue
        let range = NSRange(location: index * 2 + index, length: 2)
        attributedString.addAttributes(
            [
                .foregroundColor : color,
                .font : R.font.sofiaProBold(size: 40)!
            ],
            range: range
        )
        
        timeLabel.attributedText = attributedString
    }
    
    // MARK: Animation
    
    override func startInitialAnimation() {
        super.startInitialAnimation()
        
        timeLabel.fadeIn(duration: 0.5)
        pickerView.popIn(fromScale: 0.75, duration: 0.5, delay: 0.3)
        descriptionLabel.fadeIn(duration: 0.5, delay: 0.5)
    }
}
