//
//  MacrosFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/8/23.
//

import Foundation

class MacrosFlowCoordinator: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var macrosDIContainer: MacrosDIContainer
    
    weak var macrosViewController: MacrosViewController?
    
    // MARK: - Life cycle
    
    init(macrosDIContainer: MacrosDIContainer, macrosViewController: MacrosViewController?) {
        self.macrosDIContainer = macrosDIContainer
        self.macrosViewController = macrosViewController
    }
    
    // MARK: - Methods

    func dismiss() {
        self.macrosViewController?.dismiss(animated: true)
    }
    
}
