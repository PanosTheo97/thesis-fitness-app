//
//  ActivitySessionViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 2/8/23.
//

import UIKit

class ActivitySessionViewController: UIViewController, BaseProtocol {

    // MARK: - Properties
    
    var viewModel: ActivitySessionViewModel?
    var flowCoordinator: ActivitySessionFlowCoordinator?
    
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
//        self.navigationItem.addButtons(barButtonPositionEnum: .left,
//                                       navigationButtons: [(navigationButtonTypeEnum: .back,
//                                                            action: #selector(backButtonTapped),
//                                                            target: self)])
    }

}

struct ActivitySession {
    enum RoutingEnum {
        case dismiss
        case save
    }
}
