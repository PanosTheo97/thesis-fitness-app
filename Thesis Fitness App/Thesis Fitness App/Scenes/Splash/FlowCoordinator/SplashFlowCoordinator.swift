//
//  SplashFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation

class SplashFlowCoordinator: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var splashDIContainer: SplashDIContainer
    
    weak var splashViewController: SplashViewController?
    
    // MARK: - Life cycle
    
    init(splashDIContainer: SplashDIContainer, splashViewController: SplashViewController?) {
        self.splashDIContainer = splashDIContainer
        self.splashViewController = splashViewController
    }
    
    // MARK: - Methods

   func moveToWelcome() {
        guard let welocmeViewController = self.splashDIContainer.welcomeModule.makeWelcomeViewController() else { return }
        self.splashViewController?.navigationController?.pushViewController(welocmeViewController, animated: true)
    }
    
    func moveToLobby() {
        guard let mainNavigation = self.splashViewController?.navigationController as? MainNavigationController else {
            return
        }
        mainNavigation.flowCoordinator?.moveToLobby()
    }

}
