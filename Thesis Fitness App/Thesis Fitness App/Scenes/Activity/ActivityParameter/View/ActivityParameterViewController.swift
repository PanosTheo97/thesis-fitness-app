//
//  ActivityParameterViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 29/7/23.
//

import UIKit

class ActivityParameterViewController: UIViewController, BaseProtocol, TabBarViewControllerProtocol {

    // MARK: - IBProperties
    
    // MARK: - Properties
    
    var viewModel: ActivityParameterViewModel?
    var flowCoordinator: ActivityParameterFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.viewModel?.executeActivityParameterSetupuseCase()
    }
    
    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .systemBackground
        self.addNavigationButtons()
        self.hideTabBar()
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            case .back:
                self?.flowCoordinator?.pop()
            default: ()
            }
        })
        
    }
    
    func addNavigationButtons() {
        self.navigationItem.addButtons(barButtonPositionEnum: .left,
                                       navigationButtons: [(navigationButtonTypeEnum: .back,
                                                            action: #selector(backButtonTapped),
                                                            target: self)])
    }
    
    @objc func backButtonTapped() {
        self.viewModel?.update(routing: .back)
    }
}

struct ActivityParameter {
    enum RoutingEnum {
        case back
    }
}
