//
//  HomeModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class HomeModule {
    
    func makeHomeNavigationController(tabBarController: LobbyTabBarController) -> UINavigationController? {
        if let viewController = self.makeHomeViewController(tabBarController: tabBarController) {
            let homeNavigationController = UINavigationController(rootViewController: viewController)
            homeNavigationController.navigationBar.tintColor = .App.mainText
            homeNavigationController.navigationBar.barTintColor = .clear
            return homeNavigationController
        }
        return nil
    }
    
    func makeHomeViewController(tabBarController: LobbyTabBarController) -> HomeViewController? {
        if let viewController = HomeViewController.create(storyboardName: "Home") {
            viewController.lobbyTabBarController = tabBarController
            viewController.viewModel = makeHomeViewModel()
            viewController.flowCoordinator = makeHomeFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(homeSetupUseCase: makeHomeSetupUseCase(),
                      homePedometerUseCase: makeHomePedometerUseCase())
    }
    
    private func makeHomeFlowCoordinator(_ viewController: HomeViewController) -> HomeFlowCoordinator {
        HomeFlowCoordinator(homeDIContainer: makeHomeDIContainer(),
                              homeViewController: viewController)
    }
    
    private func makeHomeDIContainer() -> HomeDIContainer {
        HomeDIContainer()
    }
    
    private func makeHomeSetupUseCase() -> HomeSetupUseCaseProtocol {
        HomeSetupUseCase()
    }
    
    private func makeHomePedometerUseCase() -> HomePedometerUseCaseProtocol {
        HomePedometerUseCase()
    }
}
