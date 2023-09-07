//
//  MacrosModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/8/23.
//

import Foundation
import UIKit

class MacrosModule {
    
    func makeMacrosViewController(macrosViewControllerDelegate: MacrosViewControllerProtocol?, dietModels: [DietModel]) -> MacrosViewController? {
        if let viewController = MacrosViewController.create(storyboardName: "Macros") {
            viewController.viewModel = makeMacrosViewModel(dietModels: dietModels)
            viewController.flowCoordinator = makeMacrosFlowCoordinator(viewController)
            viewController.macrosViewControllerDelegate = macrosViewControllerDelegate
            return viewController
        }
        return nil
    }
    
    private func makeMacrosViewModel(dietModels: [DietModel]) -> MacrosViewModel {
        MacrosViewModel(dietModels: dietModels)
    }
    
    private func makeMacrosFlowCoordinator(_ viewController: MacrosViewController) -> MacrosFlowCoordinator {
        MacrosFlowCoordinator(macrosDIContainer: makeMacrosDIContainer(), macrosViewController: viewController)
    }
    
    private func makeMacrosDIContainer() -> MacrosDIContainer {
        MacrosDIContainer()
    }
    
//    private func makeActivityParameterSetupUseCase() -> ActivityParameterSetupUseCaseProtocol {
//        ActivityParameterSetupUseCase()
//    }
}
