//
//  ActivitySessionModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 2/8/23.
//

import Foundation

class ActivitySessionModule {
    
    func makeActivitySessionViewController() -> ActivitySessionViewController? {
        if let viewController = ActivitySessionViewController.create(storyboardName: "ActivitySession") {
            viewController.viewModel = makeActivitySessionViewModel()
            viewController.flowCoordinator = makeActivitySessionFlowCoordinator(viewController)
            viewController.modalPresentationStyle = .fullScreen
            return viewController
        }
        return nil
    }
    
    private func makeActivitySessionViewModel() -> ActivitySessionViewModel {
        ActivitySessionViewModel()
    }
    
    private func makeActivitySessionFlowCoordinator(_ viewController: ActivitySessionViewController) -> ActivitySessionFlowCoordinator {
        ActivitySessionFlowCoordinator(activitySessionDIContainer: makeActivitySessionDIContainer(), activitySessionViewController: viewController)
    }
    
    private func makeActivitySessionDIContainer() -> ActivitySessionDIContainer {
        ActivitySessionDIContainer()
    }
}
