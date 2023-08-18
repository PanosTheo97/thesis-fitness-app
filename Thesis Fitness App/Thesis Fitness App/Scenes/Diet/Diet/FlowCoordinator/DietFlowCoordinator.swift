//
//  DietFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class DietFlowCoordinator: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var dietDIContainer: DietDIContainer
    
    weak var dietViewController: DietViewController?
    
    // MARK: - Life cycle
    
    init(dietDIContainer: DietDIContainer, dietViewController: DietViewController?) {
        self.dietDIContainer = dietDIContainer
        self.dietViewController = dietViewController
    }
    
    // MARK: - Methods

    func moveToMacros() {
        guard let macrosViewController = self.dietDIContainer.macrosModule.makeMacrosViewController() else {
            return
        }
        
        self.dietViewController?.present(macrosViewController, animated: true)
    }
    
}
