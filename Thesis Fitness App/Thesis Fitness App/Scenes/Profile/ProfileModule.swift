//
//  ProfileModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class ProfileModule {
    
    func makeProfileNavigationController() -> UINavigationController? {
        if let viewController = self.makeProfileViewController() {
            let profileNavigationController = UINavigationController(rootViewController: viewController)
            return profileNavigationController
        }
        return nil
    }
    
    func makeProfileViewController() -> ProfileViewController? {
        if let viewController = ProfileViewController.create(storyboardName: "Profile") {
            viewController.viewModel = makeProfileViewModel()
            viewController.flowCoordinator = makeProfileFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel()
    }
    
    private func makeProfileFlowCoordinator(_ viewController: ProfileViewController) -> ProfileFlowCoordinator {
        ProfileFlowCoordinator(profileDIContainer: makeProfileDIContainer(), profileViewController: viewController)
    }
    
    private func makeProfileDIContainer() -> ProfileDIContainer {
        ProfileDIContainer()
    }
}
