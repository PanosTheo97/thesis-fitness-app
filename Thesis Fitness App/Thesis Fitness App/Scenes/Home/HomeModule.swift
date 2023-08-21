//
//  HomeModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class HomeModule {
    
    func makeHomeNavigationController(user: UserModel) -> UINavigationController? {
        if let viewController = self.makeHomeViewController(user: user) {
            let homeNavigationController = UINavigationController(rootViewController: viewController)
            homeNavigationController.navigationBar.tintColor = .App.mainText
            homeNavigationController.navigationBar.barTintColor = .clear
            return homeNavigationController
        }
        return nil
    }
    
    func makeHomeViewController(user: UserModel) -> HomeViewController? {
        if let viewController = HomeViewController.create(storyboardName: "Home") {
            viewController.viewModel = makeHomeViewModel(user: user)
            viewController.flowCoordinator = makeHomeFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeHomeViewModel(user: UserModel) -> HomeViewModel {
        HomeViewModel(user: user)
    }
    
    private func makeHomeFlowCoordinator(_ viewController: HomeViewController) -> HomeFlowCoordinator {
        HomeFlowCoordinator(homeDIContainer: makeHomeDIContainer(),
                              homeViewController: viewController)
    }
    
    private func makeHomeDIContainer() -> HomeDIContainer {
        HomeDIContainer()
    }
}
