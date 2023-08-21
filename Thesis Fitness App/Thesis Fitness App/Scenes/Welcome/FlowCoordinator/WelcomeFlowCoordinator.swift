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
    
    // MARK: - Methods
    
    func moveToLobby()
    func moveToRegistration()
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

    func moveToLobby() {
        guard let mainNavigation = self.welcomeViewController?.navigationController as? MainNavigationController else {
            return
        }
        mainNavigation.flowCoordinator?.moveToLobby(user: UserModel(name: "user".getLocalized(), bodyweight: "75.5", favoriteActivities: []))
    }
    
    func moveToRegistration() {
        guard let mainNavigation = self.welcomeViewController?.navigationController as? MainNavigationController else {
            return
        }
        mainNavigation.flowCoordinator?.moveToRegistration()
    }
}
