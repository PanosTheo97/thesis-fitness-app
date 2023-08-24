//
//  LobbyModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class LobbyModule {
    
    func makeLobbyTabBarController(tabBarControllers: [UIViewController]) -> LobbyTabBarController? {
        let viewController = LobbyTabBarController()
        viewController.setViewControllers(tabBarControllers, animated: false)
        viewController.viewModel = makeLobbyViewModel()
        viewController.flowCoordinator = makeLobbyFlowCoordinator(viewController)
        return viewController
    }
    
    private func makeLobbyViewModel() -> LobbyViewModel {
        LobbyViewModel()
    }
    
    private func makeLobbyFlowCoordinator(_ viewController: LobbyTabBarController) -> LobbyFlowCoordinator {
        LobbyFlowCoordinator(lobbyDIContainer: makeLobbyDIContainer(),
                              lobbyViewController: viewController)
    }
    
    private func makeLobbyDIContainer() -> LobbyDIContainer {
        LobbyDIContainer()
    }
}
