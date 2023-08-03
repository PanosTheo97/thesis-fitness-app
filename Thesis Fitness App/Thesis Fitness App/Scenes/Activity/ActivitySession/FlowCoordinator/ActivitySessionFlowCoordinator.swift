//
//  ActivitySessionFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 2/8/23.
//

import Foundation

class ActivitySessionFlowCoordinator: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var activitySessionDIContainer: ActivitySessionDIContainer
    
    weak var activitySessionViewController: ActivitySessionViewController?
    
    // MARK: - Life cycle
    
    init(activitySessionDIContainer: ActivitySessionDIContainer, activitySessionViewController: ActivitySessionViewController?) {
        self.activitySessionDIContainer = activitySessionDIContainer
        self.activitySessionViewController = activitySessionViewController
    }
    
    // MARK: - Methods

    func dismiss() {
        self.activitySessionViewController?.dismiss(animated: true)
    }
    
}
