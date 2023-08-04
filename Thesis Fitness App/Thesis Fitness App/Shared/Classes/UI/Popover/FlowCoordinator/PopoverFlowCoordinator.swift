//
//  PopoverFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import Foundation

protocol PopoverFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var popoverDIContainer: PopoverDIContainer { get }
    
    // MARK: - Life cycle
    
    init(popoverDIContainer: PopoverDIContainer)
    
}

final class PopoverFlowCoordinator: PopoverFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var popoverDIContainer: PopoverDIContainer

    weak var popoverViewController: PopoverViewController?
    
    // MARK: - Life cycle
    
    required init(popoverDIContainer: PopoverDIContainer) {
        self.popoverDIContainer = popoverDIContainer
    }

    init(popoverDIContainer: PopoverDIContainer, popoverViewController: PopoverViewController?) {
        self.popoverDIContainer = popoverDIContainer
        self.popoverViewController = popoverViewController
    }
    
}
