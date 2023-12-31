//
//  MainFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation

final class MainFlowCoordinator {
    
    // MARK: - Properties
    
    weak var mainNavigationController: MainNavigationController?
    
    var mainDIContainer: MainDIContainer
    
    // MARK: - Life cycle
    
    init(mainDIContainer: MainDIContainer, mainNavigationController: MainNavigationController?) {
        self.mainNavigationController = mainNavigationController
        self.mainDIContainer = mainDIContainer
    }
    
    func moveToLobby() {
        
        // Create LobbyTabBarController with it's respective controllers
        
        guard let lobbyTabBarController = self.mainDIContainer.lobbyModule.makeLobbyTabBarController() else {
            return
        }
        
        // Create Lobby controllers
        
        guard let homeNavigationController = self.mainDIContainer.homeModule.makeHomeNavigationController(tabBarController: lobbyTabBarController) else {
            return
        }
        homeNavigationController.tabBarItem.image = .get(image: .Home)
        homeNavigationController.title = "Lobby_homeTitle".getLocalized()
        
        guard let activityNavigationController = self.mainDIContainer.activityModule.makeActivityNavigationController(tabBarController: lobbyTabBarController) else {
            return
        }
        activityNavigationController.tabBarItem.image = .get(image: .Activity)
        activityNavigationController.title = "Lobby_activityTitle".getLocalized()
        
        guard let workoutNavigationController = self.mainDIContainer.workoutModule.makeWorkoutNavigationController() else {
            return
        }
        workoutNavigationController.tabBarItem.image = .get(image: .Workout)
        workoutNavigationController.title = "Lobby_workoutTitle".getLocalized()
        
        guard let dietNavigationController = self.mainDIContainer.dietModule.makeDietNavigationController() else {
            return
        }
        dietNavigationController.tabBarItem.image = .get(image: .Diet)
        dietNavigationController.title = "Lobby_dietTitle".getLocalized()
        
        guard let profileNavigationController = self.mainDIContainer.profileModule.makeProfileNavigationController(profileViewControllerDelegate: self.mainNavigationController) else {
            return
        }
        profileNavigationController.tabBarItem.image = .get(image: .Profile)
        profileNavigationController.title = "Lobby_profileTitle".getLocalized()
        
        let lobbyControllers = [homeNavigationController, activityNavigationController, workoutNavigationController, dietNavigationController, profileNavigationController]
        
        lobbyTabBarController.setViewControllers(lobbyControllers, animated: false)
      
        // Push Lobby to MainNavigation
        
        self.mainNavigationController?.pushViewController(lobbyTabBarController, animated: true)
    }
    
    func moveToWelcome() {
        if let welcomeViewController = self.mainNavigationController?.viewControllers.first(where: {$0 is WelcomeViewController}) {
            self.mainNavigationController?.popViewController(animated: true)
        } else {
            guard let welocmeViewController = self.mainDIContainer.welcomeModule.makeWelcomeViewController() else { return }
            
            self.mainNavigationController?.removeViewController(LobbyTabBarController.self)
            self.mainNavigationController?.pushViewController(welocmeViewController, animated: false)
        }
    }
    
    func moveToRegistration() {
        let registrationNavigationController = self.mainDIContainer.registrationModule.makeRegistrationNavigationController()
        registrationNavigationController.flowCoordinator?.moveToName()
        
        self.mainNavigationController?.present(registrationNavigationController, animated: true)
    }
    
}
