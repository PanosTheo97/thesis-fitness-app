//
//  SplashModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation

class SplashModule {
    func makeSplashViewController() -> SplashViewController? {
        if let viewController = SplashViewController.create(storyboardName: "Splash") {
            viewController.viewModel = makeSplashViewModel()
            viewController.flowCoordinator = makeSplashFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeSplashViewModel() -> SplashViewModel {
        SplashViewModel(splashCheckForUserUseCase: makeSplashCheckForUserUseCase(),
                        checkForRegistereduserUseCase: makeCheckForRegistereduserUseCase())
    }
    
    private func makeSplashFlowCoordinator(_ viewController: SplashViewController) -> SplashFlowCoordinator {
        SplashFlowCoordinator(splashDIContainer: makeSplashDIContainer(),
                              splashViewController: viewController)
    }
    
    private func makeSplashDIContainer() -> SplashDIContainer {
        SplashDIContainer()
    }
    
    private func makeSplashCheckForUserUseCase() -> SplashCheckForUserUseCaseProtocol {
        SplashCheckForUserUseCase()
    }
    
    private func makeCheckForRegistereduserUseCase() -> CheckForRegistereduserUseCaseProtocol {
       CheckForRegistereduserUseCase()
    }
}
