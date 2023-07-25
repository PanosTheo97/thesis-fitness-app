//
//  WorkoutFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class WorkoutFlowCoordinator: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var workoutDIContainer: WorkoutDIContainer
    
    weak var workoutViewController: WorkoutViewController?
    
    // MARK: - Life cycle
    
    init(workoutDIContainer: WorkoutDIContainer, workoutViewController: WorkoutViewController?) {
        self.workoutDIContainer = workoutDIContainer
        self.workoutViewController = workoutViewController
    }
    
    // MARK: - Methods

}
