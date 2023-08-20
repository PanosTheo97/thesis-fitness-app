//
//  RegistrationModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation

class RegistrationModule {
    
    func makeRegistrationNavigationController() -> RegistrationNavigationController {
        let registrationNavigationController = RegistrationNavigationController()
        registrationNavigationController.modalPresentationStyle = .fullScreen
        registrationNavigationController.navigationBar.tintColor = .App.mainText
        registrationNavigationController.navigationBar.barTintColor = .clear
        registrationNavigationController.viewModel = makeRegistrationViewModel()
        registrationNavigationController.flowCoordinator = makeRegistrationFlowCoordinator(registrationNavigationController: registrationNavigationController)
        return registrationNavigationController
    }
    
    private func makeRegistrationViewModel() -> RegistrationViewModel {
        RegistrationViewModel()
    }
    
    func makeRegistrationFlowCoordinator(registrationNavigationController: RegistrationNavigationController) -> RegistrationFlowCoordinator {
        RegistrationFlowCoordinator(registrationDIContainer: makeRegistrationDIContainer(), registrationNavigationController: registrationNavigationController)
    }
    
    private func makeRegistrationDIContainer() -> RegistrationDIContainer {
        RegistrationDIContainer()
    }
    
}
