//
//  AppFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import UIKit

class AppFlowCoordinator {
    
    // MARK: - Properties
    
    var appDIContainer: AppDIContainer
    
    // MARK: - Life cycle
    
    init(appDIContainer: AppDIContainer) {
        self.appDIContainer = appDIContainer
    }
    
    // MARK: - Methods
    
    func start(window: UIWindow?) {
        let mainNavigationController = appDIContainer.mainModule.makeMainNavigationController()
        if let viewController = appDIContainer.splashModule.makeSplashViewController() {
            mainNavigationController.setInitialViewController(viewController)
        }
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
    }
    
}
