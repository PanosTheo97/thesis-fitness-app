//
//  ActivityModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class ActivityModule {
    
    func makeHomeNavigationController() -> UINavigationController? {
        if let viewController = self.makeActivityViewController() {
            let activityNavigationController = UINavigationController(rootViewController: viewController)
            return activityNavigationController
        }
        return nil
    }
    
    func makeActivityViewController() -> ActivityViewController? {
        if let viewController = ActivityViewController.create(storyboardName: "Activity") {
            viewController.viewModel = makeActivityViewModel()
            viewController.flowCoordinator = makeActivityFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeActivityViewModel() -> ActivityViewModel {
        ActivityViewModel()
    }
    
    private func makeActivityFlowCoordinator(_ viewController: ActivityViewController) -> ActivityFlowCoordinator {
        ActivityFlowCoordinator(activityDIContainer: makeActivityDIContainer(), activityViewController: viewController)
    }
    
    private func makeActivityDIContainer() -> ActivityDIContainer {
        ActivityDIContainer()
    }
}
