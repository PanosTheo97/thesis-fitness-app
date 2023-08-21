//
//  ActivityModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class ActivityModule {
    
    func makeActivityNavigationController(favoriteActivities: [ActivityEnum]) -> UINavigationController? {
        if let viewController = self.makeActivityViewController(favoriteActivities: favoriteActivities) {
            let activityNavigationController = UINavigationController(rootViewController: viewController)
            activityNavigationController.navigationBar.tintColor = .App.mainText
            activityNavigationController.navigationBar.barTintColor = .clear
            return activityNavigationController
        }
        return nil
    }
    
    func makeActivityViewController(favoriteActivities: [ActivityEnum]) -> ActivityViewController? {
        if let viewController = ActivityViewController.create(storyboardName: "Activity") {
            viewController.viewModel = makeActivityViewModel(favoriteActivities: favoriteActivities)
            viewController.flowCoordinator = makeActivityFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeActivityViewModel(favoriteActivities: [ActivityEnum]) -> ActivityViewModel {
        ActivityViewModel(activitySetupUseCase: makeActivitySetupUseCase(), favoriteActivities: favoriteActivities)
    }
    
    private func makeActivityFlowCoordinator(_ viewController: ActivityViewController) -> ActivityFlowCoordinator {
        ActivityFlowCoordinator(activityDIContainer: makeActivityDIContainer(), activityViewController: viewController)
    }
    
    private func makeActivityDIContainer() -> ActivityDIContainer {
        ActivityDIContainer()
    }
    
    private func makeActivitySetupUseCase() -> ActivitySetupUseCaseProtocol {
        ActivitySetupUseCase()
    }
}
