//
//  RegistrationFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation

final class RegistrationFlowCoordinator {
    
    // MARK: - Properties
    
    weak var registrationNavigationController: RegistrationNavigationController?
    
    var registrationDIContainer: RegistrationDIContainer
    
    // MARK: - Life cycle
    
    init(registrationDIContainer: RegistrationDIContainer, registrationNavigationController: RegistrationNavigationController?) {
        self.registrationNavigationController = registrationNavigationController
        self.registrationDIContainer = registrationDIContainer
    }
    
    func moveToName() {
        guard let nameViewController = NameViewController.create(storyboardName: "Name") else {
            return
        }
        nameViewController.viewModel = registrationNavigationController?.viewModel
        nameViewController.registrationNavigation = registrationNavigationController
        
        registrationNavigationController?.setInitialViewController(nameViewController)
    }
    
    func moveToBodyComposition() {
        guard let bodyCompositionViewController = BodyCompositionViewController.create(storyboardName: "BodyComposition") else {
            return
        }
        bodyCompositionViewController.viewModel = registrationNavigationController?.viewModel
        bodyCompositionViewController.registrationNavigation = registrationNavigationController

        registrationNavigationController?.pushViewController(bodyCompositionViewController, animated: true)
    }
    
    func moveToActivityGoals() {
        guard let activityGoalsViewController = ActivityGoalsViewController.create(storyboardName: "ActivityGoals") else {
            return
        }
        activityGoalsViewController.viewModel = registrationNavigationController?.viewModel
        activityGoalsViewController.registrationNavigation = registrationNavigationController

        registrationNavigationController?.pushViewController(activityGoalsViewController, animated: true)
    }
    
    func moveToFavoriteActivities() {
        guard let favoriteActivitiesViewController = FavoriteActivitiesViewController.create(storyboardName: "FavoriteActivities") else {
            return
        }
        favoriteActivitiesViewController.viewModel = registrationNavigationController?.viewModel
        favoriteActivitiesViewController.registrationNavigation = registrationNavigationController

        registrationNavigationController?.pushViewController(favoriteActivitiesViewController, animated: true)
    }
    
    func moveToDietGoals() {
        guard let dietGoalsViewController = DietGoalsViewController.create(storyboardName: "DietGoals") else {
            return
        }
        dietGoalsViewController.viewModel = registrationNavigationController?.viewModel
        dietGoalsViewController.registrationNavigation = registrationNavigationController

        registrationNavigationController?.pushViewController(dietGoalsViewController, animated: true)
    }
    
    func moveToLobby(user: UserModel) {
        guard let presentingViewController = self.registrationNavigationController?.presentingViewController as? MainNavigationController else {
            return
        }
        presentingViewController.flowCoordinator?.moveToLobby(user: user)
        self.registrationNavigationController?.dismiss(animated: true)
    }
    
    func pop() {
        registrationNavigationController?.popViewController(animated: true)
    }
    
}
