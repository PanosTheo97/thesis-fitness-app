//
//  WelcomeFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import Foundation

protocol WelcomeFlowCoordinatorProtocol: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var welcomeDIContainer: WelcomeDIContainer { get }
}

class WelcomeFlowCoordinator: WelcomeFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var welcomeDIContainer: WelcomeDIContainer
    
    weak var welcomeViewController: WelcomeViewController?
    
    // MARK: - Life cycle
    
    init(welcomeDIContainer: WelcomeDIContainer, welcomeViewController: WelcomeViewController?) {
        self.welcomeDIContainer = welcomeDIContainer
        self.welcomeViewController = welcomeViewController
    }
    
    // MARK: - Methods

}
