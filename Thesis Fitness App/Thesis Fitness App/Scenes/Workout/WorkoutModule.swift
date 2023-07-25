//
//  WorkoutModule.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

class WorkoutModule {
    
    func makeWorkoutNavigationController() -> UINavigationController? {
        if let viewController = self.makeWorkoutViewController() {
            let workoutNavigationController = UINavigationController(rootViewController: viewController)
            return workoutNavigationController
        }
        return nil
    }
    
    func makeWorkoutViewController() -> WorkoutViewController? {
        if let viewController = WorkoutViewController.create(storyboardName: "Workout") {
            viewController.viewModel = makeWorkoutViewModel()
            viewController.flowCoordinator = makeWorkoutFlowCoordinator(viewController)
            return viewController
        }
        return nil
    }
    
    private func makeWorkoutViewModel() -> WorkoutViewModel {
        WorkoutViewModel()
    }
    
    private func makeWorkoutFlowCoordinator(_ viewController: WorkoutViewController) -> WorkoutFlowCoordinator {
        WorkoutFlowCoordinator(workoutDIContainer: makeWorkoutDIContainer(), workoutViewController: viewController)
    }
    
    private func makeWorkoutDIContainer() -> WorkoutDIContainer {
        WorkoutDIContainer()
    }
}
