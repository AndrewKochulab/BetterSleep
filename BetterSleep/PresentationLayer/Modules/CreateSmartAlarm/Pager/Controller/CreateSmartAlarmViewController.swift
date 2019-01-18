//
//  CreateSmartAlarmViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class CreateSmartAlarmViewController: ViewController<
    CreateSmartAlarmControllerView,
    CreateSmartAlarmControllerViewModel
> {
    
    // MARK: - Properties
    // MARK: Callbacks
    
    var willShowPreviousPage: EmptyClosure?
    var didSubmit: EmptyClosure?
    
    
    // MARK: - Appearance
    
    func pager() -> CreateSmartAlarmPager {
        return rootView.pageViewController
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configureView() {
        super.configureView()
        
        rootView.willAddPagerAsChildController = { [unowned self] pageViewController in
            self.addChild(pageViewController)
        }
        
        rootView.willMovePagerToParent = { [unowned self] pageViewController in
            pageViewController.didMove(toParent: self)
        }
        
        rootView.contentHeaderView.didPressBack = { [unowned self] in
            self.willShowPreviousPage?()
        }
        
        rootView.contentFooterView.didPressSubmit = { [unowned self] in
            self.didSubmit?()
        }
    }
    
    func willChangeContent(to pageController: CreateSmartAlarmPageViewController) {
        let viewModel = pageController.viewModel
        rootView.contentHeaderView.title = viewModel.title
        rootView.contentHeaderView.isBackVisible = viewModel.isBackVisible
        
        rootView.contentFooterView.submitTitle = viewModel.submitTitle
        rootView.contentFooterView.isSubmitEnabled = viewModel.isSubmitEnabled
        rootView.contentFooterView.isSubmitVisible = viewModel.isSubmitVisible
    }
}
