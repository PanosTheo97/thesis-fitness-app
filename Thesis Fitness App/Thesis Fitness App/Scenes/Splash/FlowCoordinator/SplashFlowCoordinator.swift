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

   func moveToHome() {
//        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//            guard let homeViewController = self.splashDIContainer.homeModule.makeHomeViewController() else { return }
//            self.splashViewController?.navigationController?.pushViewController(homeViewController, animated: true)
//        }
    }

}
