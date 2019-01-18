//
//  CreateSmartAlarmControllerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit
import SnapKit

final class CreateSmartAlarmPager: NavigationController {

}

final class CreateSmartAlarmControllerView: ControllerView {
    
    // MARK: - Types
    
    typealias WillAddPagerAsChildController = (CreateSmartAlarmPager) -> Void
    typealias WillMovePagerToParent = (CreateSmartAlarmPager) -> Void
    
    
    // MARK: - Properties
    // MARK: Content
    
    // MARK: Callbacks
    
    var willAddPagerAsChildController: WillAddPagerAsChildController?
    var willMovePagerToParent: WillMovePagerToParent?
    
    // MARK: Views
    
    private lazy var headerView = configuredHeaderView()
    private lazy var closeButton = configuredCloseButton()
    
    private lazy var contentView = configuredContentView()
    
    lazy var contentHeaderView = configuredContentHeaderView()
    lazy var pageViewController = configuredPageViewController()
    lazy var contentFooterView = configuredContentFooterView()
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachHeaderView()
        attachCloseButton()
        
        attachContentView()
        attachContentHeaderView()
        attachPageViewController()
        attachContentFooterView()
    }
    
    override func configuredContainerView() -> View {
        let view = super.configuredContainerView()
        view.backgroundColor = UIColor(white: 0.05, alpha: 0.95)
        
        return view
    }
    
    private func configuredHeaderView() -> View {
        return .init()
    }
    
    private func configuredCloseButton() -> Button {
        let button = Button()
        
        return button
    }
    
    private func configuredContentView() -> View {
        return .init()
    }
    
    private func configuredContentHeaderView() -> CreateSmartAlarmPagerHeaderView {
        return .init()
    }
    
    private func configuredPageViewController() -> CreateSmartAlarmPager {
        let pager = CreateSmartAlarmPager()
        pager.view.autoresizingMask = []
        pager.view.translatesAutoresizingMaskIntoConstraints = false
        
        return pager
    }
    
    private func configuredContentFooterView() -> CreateSmartAlarmPagerFooterView {
        return .init()
    }
    
    // MARK: Attachments
    
    private func attachHeaderView() {
        containerView.addSubview(headerView)
        
        headerView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.height.equalTo(100)
        }
    }
    
    private func attachCloseButton() {
        headerView.addSubview(closeButton)
        
        closeButton.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.right.equalToSuperview().inset(20)
            maker.height.equalTo(60)
            maker.width.equalTo(60)
        }
    }
    
    private func attachContentView() {
        containerView.addSubview(contentView)
        
        contentView.snp.makeConstraints { maker in
            maker.top.greaterThanOrEqualToSuperview()
            maker.bottom.lessThanOrEqualToSuperview()
            maker.center.equalToSuperview()
            maker.left.right.equalToSuperview()
        }
    }
    
    private func attachContentHeaderView() {
        contentView.addSubview(contentHeaderView)
        
        contentHeaderView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.height.equalTo(80)
        }
    }
    
    private func attachPageViewController() {
        willAddPagerAsChildController?(pageViewController)

        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pageViewController.view)
        
        var height: Constraint? // FIXME: Please remove this
        
        pageViewController.view.snp.makeConstraints { maker in
            maker.top.equalTo(contentHeaderView.snp.bottom)
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.lessThanOrEqualToSuperview()
            height = maker.height.equalTo(300).constraint
        }
        
        height?.activate()
        
        willMovePagerToParent?(pageViewController)
    }
    
    private func attachContentFooterView() {
        contentView.addSubview(contentFooterView)
        
        contentFooterView.snp.makeConstraints { maker in
            maker.top.equalTo(pageViewController.view.snp.bottom)
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.height.equalTo(60)
        }
    }
}
