//
//  ActivitySessionModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 2/8/23.
//

import Foundation
import UIKit

class ActivitySessionModule {
    
    func makeActivitySessionNavigationController(activitySessionViewControllerDelegate: ActivitySessionViewControllerProtocol?) -> UINavigationController? {
        if let viewController = self.makeActivitySessionViewController(activitySessionViewControllerDelegate: activitySessionViewControllerDelegate) {
            let activityNavigationController = UINavigationController(rootViewController: viewController)
            activityNavigationController.navigationBar.tintColor = .App.mainText
            activityNavigationController.navigationBar.barTintColor = .clear
            activityNavigationController.modalPresentationStyle = .fullScreen
            return activityNavigationController
        }
        return nil
    }
    
    func makeActivitySessionViewController(activitySessionViewControllerDelegate: ActivitySessionViewControllerProtocol?) -> ActivitySessionViewController? {
        if let viewController = ActivitySessionViewController.create(storyboardName: "ActivitySession") {
            viewController.viewModel = makeActivitySessionViewModel()
            viewController.flowCoordinator = makeActivitySessionFlowCoordinator(viewController)
            viewController.activitySessionViewControllerDelegate = activitySessionViewControllerDelegate
            return viewController
        }
        return nil
    }
    
    private func makeActivitySessionViewModel() -> ActivitySessionViewModel {
        ActivitySessionViewModel(activitySessionSetupUseCase: makeActivitySessionSetupUseCase())
    }
    
    private func makeActivitySessionFlowCoordinator(_ viewController: ActivitySessionViewController) -> ActivitySessionFlowCoordinator {
        ActivitySessionFlowCoordinator(activitySessionDIContainer: makeActivitySessionDIContainer(), activitySessionViewController: viewController)
    }
    
    private func makeActivitySessionDIContainer() -> ActivitySessionDIContainer {
        ActivitySessionDIContainer()
    }
    
    private func makeActivitySessionSetupUseCase() -> ActivitySessionSetupUseCaseProtocol {
        ActivitySessionSetupUseCase()
    }
}
