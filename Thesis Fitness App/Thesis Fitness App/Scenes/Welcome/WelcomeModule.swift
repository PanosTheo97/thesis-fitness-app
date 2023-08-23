//
//  WelcomeModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import Foundation

class WelcomeModule {
    func makeWelcomeViewController() -> WelcomeViewController? {
        if let viewController = WelcomeViewController.create(storyboardName: "Welcome") {
            viewController.viewModel = makeWelcomeViewModel()
            viewController.flowCoordinator = makeWelcomeFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeWelcomeViewModel() -> WelcomeViewModelProtocol {
        WelcomeViewModel(welcomeSignInUseCase: makeWelcomeSignInUseCase(),
                         welcomeCheckForRegistereduserUseCase: makeWelcomeCheckForRegistereduserUseCase())
    }
    
    private func makeWelcomeFlowCoordinator(_ viewController: WelcomeViewController) -> WelcomeFlowCoordinatorProtocol {
        WelcomeFlowCoordinator(welcomeDIContainer: makeWelcomeDIContainer(),
                               welcomeViewController: viewController)
    }
    
    private func makeWelcomeDIContainer() -> WelcomeDIContainer {
        WelcomeDIContainer()
    }
    
    private func makeWelcomeSignInUseCase() -> WelcomeSignInUseCaseProtocol {
        WelcomeSignInUseCase()
    }
    
    private func makeWelcomeCheckForRegistereduserUseCase() -> WelcomeCheckForRegistereduserUseCaseProtocol {
        WelcomeCheckForRegistereduserUseCase()
    }
    
}
