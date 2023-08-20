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
//        guard let nameViewController = NameViewController.create(storyboardName: "Name") else {
//            return
//        }
//        nameViewController.viewModel = registrationNavigationController?.viewModel
//        nameViewController.registrationNavigation = registrationNavigationController
//
//        registrationNavigationController?.pushViewController(activityGoalsViewController, animated: true)
    }
    
    func moveToDietGoals() {
//        guard let nameViewController = NameViewController.create(storyboardName: "Name") else {
//            return
//        }
//        nameViewController.viewModel = registrationNavigationController?.viewModel
//        nameViewController.registrationNavigation = registrationNavigationController
//
//        registrationNavigationController?.pushViewController(activityGoalsViewController, animated: true)
    }
    
    func pop() {
        registrationNavigationController?.popViewController(animated: true)
    }
    
}
