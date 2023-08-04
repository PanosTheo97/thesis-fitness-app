//
//  PopoverModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import Foundation
import UIKit

final class PopoverModule {

    func makePopoverViewController(popOverConfiguration: PopoverConfiguration, popOverSetupUseCaseEnum: PopoverSetupUseCaseEnum) -> PopoverViewController? {
        if let viewController = PopoverViewController.create(storyboardName: "Popover") {
            viewController.viewModel = makePopoverViewModel(popoverSetupUseCaseEnum: popOverSetupUseCaseEnum)
            viewController.popoverConfiguration = popOverConfiguration
            viewController.flowCoordinator = makePopoverFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }

    private func makePopoverViewModel(popoverSetupUseCaseEnum: PopoverSetupUseCaseEnum) -> PopoverViewModelProtocol {
        PopoverViewModel(popoverSetupUseCase: self.makePopoverSetupUseCaseProtocol(popoverSetupUseCaseEnum: popoverSetupUseCaseEnum))
    }
    
    private func makePopoverFlowCoordinator(_ viewController: PopoverViewController) -> PopoverFlowCoordinatorProtocol {
        PopoverFlowCoordinator(popoverDIContainer: makePopoverDIContainer(),
                              popoverViewController: viewController)
    }
    
    private func makePopoverDIContainer() -> PopoverDIContainer {
        PopoverDIContainer()
    }
    
    private func makePopoverSetupUseCaseProtocol(popoverSetupUseCaseEnum: PopoverSetupUseCaseEnum) -> PopoverSetupUseCaseProtocol {
        return PopoverSetupUseCase(popoverSetupUseCaseEnum: popoverSetupUseCaseEnum)
    }

}
