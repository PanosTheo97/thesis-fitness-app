//
//  LobbyModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class LobbyModule {
    
    func makeLobbyTabBarController(tabBarControllers: [UIViewController], user: UserModel) -> LobbyTabBarController? {
        let viewController = LobbyTabBarController()
        viewController.setViewControllers(tabBarControllers, animated: false)
        viewController.viewModel = makeLobbyViewModel(user: user)
        viewController.flowCoordinator = makeLobbyFlowCoordinator(viewController)
        return viewController
    }
    
    private func makeLobbyViewModel(user: UserModel) -> LobbyViewModel {
        LobbyViewModel(user: user)
    }
    
    private func makeLobbyFlowCoordinator(_ viewController: LobbyTabBarController) -> LobbyFlowCoordinator {
        LobbyFlowCoordinator(lobbyDIContainer: makeLobbyDIContainer(),
                              lobbyViewController: viewController)
    }
    
    private func makeLobbyDIContainer() -> LobbyDIContainer {
        LobbyDIContainer()
    }
}
