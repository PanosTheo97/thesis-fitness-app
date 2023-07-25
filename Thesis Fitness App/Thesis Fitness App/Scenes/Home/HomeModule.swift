//
//  HomeModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class HomeModule {
    
    func makeHomeNavigationController() -> UINavigationController? {
        if let viewController = self.makeHomeViewController() {
            let homeNavigationController = UINavigationController(rootViewController: viewController)
            homeNavigationController.navigationBar.tintColor = .App.mainText
            homeNavigationController.navigationBar.barTintColor = .clear
            return homeNavigationController
        }
        return nil
    }
    
    func makeHomeViewController() -> HomeViewController? {
        if let viewController = HomeViewController.create(storyboardName: "Home") {
            viewController.viewModel = makeHomeViewModel()
            viewController.flowCoordinator = makeHomeFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel()
    }
    
    private func makeHomeFlowCoordinator(_ viewController: HomeViewController) -> HomeFlowCoordinator {
        HomeFlowCoordinator(homeDIContainer: makeHomeDIContainer(),
                              homeViewController: viewController)
    }
    
    private func makeHomeDIContainer() -> HomeDIContainer {
        HomeDIContainer()
    }
}
