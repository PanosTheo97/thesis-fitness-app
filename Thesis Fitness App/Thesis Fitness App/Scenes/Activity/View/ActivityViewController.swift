//
//  ActivityViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit

class ActivityViewController: UIViewController, BaseProtocol {

    // MARK: - IBProperties
    
    // MARK: - Properties
    
    var viewModel: ActivityViewModel?
    var flowCoordinator: ActivityFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            default: ()
            }
        })
        
    }
}

struct Activity {
    enum RoutingEnum {
        case test
    }
}
