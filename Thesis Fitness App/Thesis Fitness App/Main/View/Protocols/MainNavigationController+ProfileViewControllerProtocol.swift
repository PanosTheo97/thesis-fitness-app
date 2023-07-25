//
//  MainNavigationController+ProfileViewControllerProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

extension MainNavigationController: ProfileViewControllerProtocol {
    func moveToWelcome() {
        self.flowCoordinator?.moveToWelcome()
    }
}
