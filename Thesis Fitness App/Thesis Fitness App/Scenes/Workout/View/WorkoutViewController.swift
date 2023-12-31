//
//  WorkoutViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit

class WorkoutViewController: UIViewController, BaseProtocol {

    // MARK: - IBProperties
    
    // MARK: - Properties
    
    var viewModel: WorkoutViewModel?
    var flowCoordinator: WorkoutFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .systemBackground
        self.addNavigationButtons()
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            default: ()
            }
        })
        
    }
    
    func addNavigationButtons() {
        self.navigationItem.addTitle(title: "Lobby_workoutTitle".getLocalized())
    }

}

struct Workout {
    enum RoutingEnum {
        case test
    }
}
