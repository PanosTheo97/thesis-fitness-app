//
//  HomeFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class HomeFlowCoordinator: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var homeDIContainer: HomeDIContainer
    
    weak var homeViewController: HomeViewController?
    
    // MARK: - Life cycle
    
    init(homeDIContainer: HomeDIContainer, homeViewController: HomeViewController?) {
        self.homeDIContainer = homeDIContainer
        self.homeViewController = homeViewController
    }
    
    // MARK: - Methods

}
