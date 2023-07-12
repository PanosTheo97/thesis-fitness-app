//
//  MainModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation

class MainModule {
    
    func makeMainNavigationController() -> MainNavigationController {
        let mainNavigationController = MainNavigationController()
        mainNavigationController.flowCoordinator = makeMainFlowCoordinator(mainNavigationController: mainNavigationController)
        return mainNavigationController
    }
    
    func makeMainFlowCoordinator(mainNavigationController: MainNavigationController) -> MainFlowCoordinator {
        MainFlowCoordinator(mainNavigationController: mainNavigationController)
    }
    
}
