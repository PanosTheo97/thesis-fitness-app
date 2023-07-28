//
//  ActivityParameterModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 29/7/23.
//

import Foundation

class ActivityParameterModule {
    
    func makeActivityParameterViewController(activityId: String) -> ActivityParameterViewController? {
        if let viewController = ActivityParameterViewController.create(storyboardName: "ActivityParameter") {
            viewController.viewModel = makeActivityParameterViewModel(activityId: activityId)
            viewController.flowCoordinator = makeActivityParameterFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeActivityParameterViewModel(activityId: String) -> ActivityParameterViewModel {
        ActivityParameterViewModel(activityId: activityId, activityParameterSetupUseCase: makeActivityParameterSetupUseCase())
    }
    
    private func makeActivityParameterFlowCoordinator(_ viewController: ActivityParameterViewController) -> ActivityParameterFlowCoordinator {
        ActivityParameterFlowCoordinator(activityParameterDIContainer: makeActivityParameterDIContainer(), activityParameterViewController: viewController)
    }
    
    private func makeActivityParameterDIContainer() -> ActivityParameterDIContainer {
        ActivityParameterDIContainer()
    }
    
    private func makeActivityParameterSetupUseCase() -> ActivityParameterSetupUseCaseProtocol {
        ActivityParameterSetupUseCase()
    }
}
