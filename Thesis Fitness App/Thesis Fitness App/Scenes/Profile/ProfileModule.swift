//
//  ProfileModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class ProfileModule {
    
    func makeProfileNavigationController(profileViewControllerDelegate: ProfileViewControllerProtocol?) -> UINavigationController? {
        if let viewController = self.makeProfileViewController(profileViewControllerDelegate: profileViewControllerDelegate) {
            let profileNavigationController = UINavigationController(rootViewController: viewController)
            profileNavigationController.navigationBar.tintColor = .App.mainText
            profileNavigationController.navigationBar.barTintColor = .clear
            return profileNavigationController
        }
        return nil
    }
    
    func makeProfileViewController(profileViewControllerDelegate: ProfileViewControllerProtocol?) -> ProfileViewController? {
        if let viewController = ProfileViewController.create(storyboardName: "Profile") {
            viewController.profileViewControllerDelegate = profileViewControllerDelegate
            viewController.viewModel = makeProfileViewModel()
            viewController.flowCoordinator = makeProfileFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(profileLogoutUseCase: makeProfileLogoutUseCase())
    }
    
    private func makeProfileFlowCoordinator(_ viewController: ProfileViewController) -> ProfileFlowCoordinator {
        ProfileFlowCoordinator(profileDIContainer: makeProfileDIContainer(), profileViewController: viewController)
    }
    
    private func makeProfileDIContainer() -> ProfileDIContainer {
        ProfileDIContainer()
    }
    
    private func makeProfileLogoutUseCase() -> ProfileLogoutUseCaseProtocol {
        ProfileLogoutUseCase()
    }
}
