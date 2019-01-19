//
//  ChooseSleepMonitoringTypeControllerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class ChooseSleepMonitoringTypeControllerView: CreateSmartAlarmPageControllerView {
    
    // MARK: - Properties
    // MARK: Content
    
    var monitoringType: MonitoringType? {
        let audioMonitoring = audioMonitoringSelectionControl.isSelected
        let gyroscopeMonitoring = gyroscopeMonitoringSelectionControl.isSelected
        
        if audioMonitoring && gyroscopeMonitoring {
            return .all
        }
        
        if audioMonitoring {
            return .audio
        }
        
        if gyroscopeMonitoring {
            return .gyroscope
        }
        
        return nil
    }
    
    // MARK: Views
    
    private lazy var componentsView = configuredComponentsView()
    private lazy var audioMonitoringSelectionControl = configuredAudioMonitoringSelectionControl()
    private lazy var gyroscopeMonitoringSelectionControl = configuredGyroscopeMonitoringSelectionControl()
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachComponentsView()
        attachAudioMonitoringSelectionControl()
        attachGyroscopeMonitoringSelectionControl()
    }
    
    private func configuredComponentsView() -> View {
        return .init()
    }
    
    private func configuredAudioMonitoringSelectionControl() -> MonitoringTypeSelectionControl {
        let control = MonitoringTypeSelectionControl()
//        control.image
        control.title = "Audio"
        control.didTouchUpInside = { [unowned control] in
            control.isSelected = !control.isSelected
        }
        
        return control
    }
    
    private func configuredGyroscopeMonitoringSelectionControl() -> MonitoringTypeSelectionControl {
        let control = MonitoringTypeSelectionControl()
//        control.image
        control.title = "Gyroscope"
        control.didTouchUpInside = { [unowned control] in
            control.isSelected = !control.isSelected
        }
        
        return control
    }
    
    // MARK: Attachments
    
    private func attachComponentsView() {
        contentView.addSubview(componentsView)
        
        componentsView.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview().multipliedBy(0.8)
            maker.left.right.equalToSuperview().inset(12)
            maker.height.equalTo(140)
        }
    }
    
    private func attachAudioMonitoringSelectionControl() {
        componentsView.addSubview(audioMonitoringSelectionControl)
        
        audioMonitoringSelectionControl.snp.makeConstraints { maker in
            maker.top.left.bottom.equalToSuperview()
        }
    }
    
    private func attachGyroscopeMonitoringSelectionControl() {
        componentsView.addSubview(gyroscopeMonitoringSelectionControl)
        
        gyroscopeMonitoringSelectionControl.snp.makeConstraints { maker in
            maker.top.right.bottom.equalToSuperview()
            maker.left.equalTo(audioMonitoringSelectionControl.snp.right)
            maker.width.equalTo(audioMonitoringSelectionControl.snp.width)
        }
    }
    
    // MARK: Animation
    
    override func startInitialAnimation() {
        super.startInitialAnimation()
        
        componentsView.fadeIn(duration: 0.5)
        descriptionLabel.fadeIn(duration: 0.5, delay: 0.3)
    }
}
