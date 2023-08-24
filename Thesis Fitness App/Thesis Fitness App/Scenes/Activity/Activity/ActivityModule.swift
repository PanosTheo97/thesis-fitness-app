//
//  ActivityModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class ActivityModule {
    
    func makeActivityNavigationController(tabBarController: LobbyTabBarController) -> UINavigationController? {
        if let viewController = self.makeActivityViewController(tabBarController: tabBarController) {
            let activityNavigationController = UINavigationController(rootViewController: viewController)
            activityNavigationController.navigationBar.tintColor = .App.mainText
            activityNavigationController.navigationBar.barTintColor = .clear
            return activityNavigationController
        }
        return nil
    }
    
    func makeActivityViewController(tabBarController: LobbyTabBarController) -> ActivityViewController? {
        if let viewController = ActivityViewController.create(storyboardName: "Activity") {
            viewController.lobbyTabBarController = tabBarController
            viewController.viewModel = makeActivityViewModel()
            viewController.flowCoordinator = makeActivityFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeActivityViewModel() -> ActivityViewModel {
        ActivityViewModel(activitySetupUseCase: makeActivitySetupUseCase())
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
