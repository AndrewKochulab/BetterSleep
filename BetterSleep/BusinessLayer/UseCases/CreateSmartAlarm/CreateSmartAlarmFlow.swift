//
//  CreateSmartAlarmFlow.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class CreateSmartAlarmFlow: BaseFlow<
    CreateSmartAlarmFlowContent,
    CreateSmartAlarmFlowAssembly
>, UIPageViewControllerDelegate {
   
    // MARK: - Properties
    // MARK: Flow
    
    private let pageController: CreateSmartAlarmViewController
    
    private lazy var pager: CreateSmartAlarmPager = {
        return pageController.pager()
    }()
    
    
    // MARK: - Initialization
    
    override init(
        content: Content,
        assembly: Assembly,
        navigationController: NavigationController
    ) {
        pageController = assembly.initialController()
        
        super.init(
            content: content,
            assembly: assembly,
            navigationController: navigationController
        )
        
        pageController.isModalInPopover = true
        pageController.modalPresentationStyle = .overFullScreen
        pageController.modalTransitionStyle = .crossDissolve
        
        pager.setNavigationBarHidden(true, animated: false)
        
        pageController.willShowPreviousPage = { [unowned self] in
            guard let previousPage = self.content.visiblePage.previous() else {
                return
            }
            
            self.popPageController(for: previousPage)
        }
        
        pageController.didSubmit = { [unowned self] in
            guard let nextPage = self.content.visiblePage.next() else {
                return
            }
            
            self.showPageController(for: nextPage)
        }
    }
    
    // MARK: - Appearance
    
    override func showInitialController(
        animated: Bool,
        completion: @escaping () -> Void
    ) {
        navigationController.present(
            controller: pageController,
            animated: animated,
            configuration: { [unowned self] controller in
                let pageViewController = self.pageViewController(for: self.content.visiblePage)
                self.pageController.willChangeContent(to: pageViewController)
                self.pager.set(controller: pageViewController, animated: false, completion: { })
            },
            completion: completion
        )
    }
    
    private func pageViewController(
        for page: Content.Page
    ) -> CreateSmartAlarmPageViewController {
        switch page {
            case .chooseAlarmTime:
                return assembly.chooseWakeUpTimeController()
            
            case .chooseAlarmWindow:
                return assembly.chooseWakeUpWindowController()
            
            case .chooseMonitoringType:
                return assembly.chooseSleepMonitoringTypeController()
            
            case .requestMonitoringPermissions:
                return assembly.requestMonitoringPermissionsController()
        }
    }
    
    private func page(
        from viewController: CreateSmartAlarmPageViewController
    ) -> Content.Page? {
        switch viewController {
            case is ChooseWakeUpTimeViewController:
                return .chooseAlarmTime
            
            case is ChooseWakeUpWindowViewController:
                return .chooseAlarmWindow
            
            case is ChooseSleepMonitoringTypeViewController:
                return .chooseMonitoringType
            
            case is RequestMonitoringPermissionsViewController:
                return .requestMonitoringPermissions
            
            default:
                return nil
        }
    }
    
    private func popPageController(
        for page: Content.Page
    ) {
        guard let previousViewController = pager.viewControllers.dropLast().last as? CreateSmartAlarmPageViewController else {
            return
        }
        
        pageController.willChangeContent(to: previousViewController)
        pager.pop(animated: false) {
            self.content.visiblePage = page
        }
    }
    
    private func showPageController(
        for page: Content.Page
    ) {
        let controller = pageViewController(for: page)
        pageController.willChangeContent(to: controller)
        
        pager.push(controller: controller, animated: false, completion: { [unowned self] in
            self.content.visiblePage = page
        })
    }
}
