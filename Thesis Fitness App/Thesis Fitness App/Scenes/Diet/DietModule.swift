//
//  DietModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class DietModule {
    
    func makeDietNavigationController() -> UINavigationController? {
        if let viewController = self.makeDietViewController() {
            let dietNavigationController = UINavigationController(rootViewController: viewController)
            return dietNavigationController
        }
        return nil
    }
    
    func makeDietViewController() -> DietViewController? {
        if let viewController = DietViewController.create(storyboardName: "Diet") {
            viewController.viewModel = makeDietViewModel()
            viewController.flowCoordinator = makeDietFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeDietViewModel() -> DietViewModel {
        DietViewModel()
    }
    
    private func makeDietFlowCoordinator(_ viewController: DietViewController) -> DietFlowCoordinator {
        DietFlowCoordinator(dietDIContainer: makeDietDIContainer(), dietViewController: viewController)
    }
    
    private func makeDietDIContainer() -> DietDIContainer {
        DietDIContainer()
    }
}
