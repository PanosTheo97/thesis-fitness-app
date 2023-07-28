//
//  ActivityParameterFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 29/7/23.
//

import Foundation

class ActivityParameterFlowCoordinator: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var activityParameterDIContainer: ActivityParameterDIContainer
    
    weak var activityParameterViewController: ActivityParameterViewController?
    
    // MARK: - Life cycle
    
    init(activityParameterDIContainer: ActivityParameterDIContainer, activityParameterViewController: ActivityParameterViewController?) {
        self.activityParameterDIContainer = activityParameterDIContainer
        self.activityParameterViewController = activityParameterViewController
    }
    
    // MARK: - Methods

    func pop() {
        self.activityParameterViewController?.navigationController?.popViewController(animated: true)
    }
    
}
