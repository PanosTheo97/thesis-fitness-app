//
//  ActivityFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class ActivityFlowCoordinator: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var activityDIContainer: ActivityDIContainer
    
    weak var activityViewController: ActivityViewController?
    
    // MARK: - Life cycle
    
    init(activityDIContainer: ActivityDIContainer, activityViewController: ActivityViewController?) {
        self.activityDIContainer = activityDIContainer
        self.activityViewController = activityViewController
    }
    
    // MARK: - Methods

    func moveToActivityParameter(activityId: String) {
        guard let activityParameterViewController = self.activityDIContainer.activityParameterModule.makeActivityParameterViewController(activityId: activityId) else {
            return
        }
        
        self.activityViewController?.navigationController?.pushViewController(activityParameterViewController, animated: true)
    }
    
}
