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
    
    // MARK: - Life cycle
    
    init(mainNavigationController: MainNavigationController?) {
        self.mainNavigationController = mainNavigationController
    }
    
}
