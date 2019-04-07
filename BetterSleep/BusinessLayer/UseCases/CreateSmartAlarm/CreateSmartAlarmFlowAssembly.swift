//
//  CreateSmartAlarmFlowAssembly.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/14/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import Foundation

final class CreateSmartAlarmFlowAssembly: BaseFlowAssembly {
    
    // MARK: - Appearance
    
    func initialController(
        viewModel: CreateSmartAlarmControllerViewModel = .init()
    ) -> CreateSmartAlarmViewController {
        return .init(
            viewModel: viewModel
        )
    }

    func chooseWakeUpTimeController(
        viewModel: ChooseWakeUpTimeControllerViewModel = .init()
    ) -> ChooseWakeUpTimeViewController {
        return .init(
            pageView: ChooseWakeUpTimeControllerView(),
            pageViewModel: viewModel
        )
    }
    
    func chooseWakeUpWindowController(
        viewModel: ChooseWakeUpWindowControllerViewModel = .init()
    ) -> ChooseWakeUpWindowViewController {
        return .init(
            pageView: ChooseWakeUpWindowControllerView(),
            pageViewModel: viewModel
        )
    }
    
    func chooseSleepMonitoringTypeController(
        viewModel: ChooseSleepMonitoringTypeControllerViewModel = .init()
    ) -> ChooseSleepMonitoringTypeViewController {
        return .init(
            pageView: ChooseSleepMonitoringTypeControllerView(),
            pageViewModel: viewModel
        )
    }
    
    func requestMonitoringPermissionsController(
        viewModel: RequestMonitoringPermissionsControllerViewModel = .init()
    ) -> RequestMonitoringPermissionsViewController {
        return .init(
            pageView: RequestMonitoringPermissionsControllerView(),
            pageViewModel: viewModel
        )
    }
}
