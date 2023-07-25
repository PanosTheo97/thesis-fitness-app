//
//  ProfileFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class ProfileFlowCoordinator: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var profileDIContainer: ProfileDIContainer
    
    weak var profileViewController: ProfileViewController?
    
    // MARK: - Life cycle
    
    init(profileDIContainer: ProfileDIContainer, profileViewController: ProfileViewController?) {
        self.profileDIContainer = profileDIContainer
        self.profileViewController = profileViewController
    }
    
    // MARK: - Methods

}
