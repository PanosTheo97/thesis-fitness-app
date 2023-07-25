//
//  HomeViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit

class HomeViewController: UIViewController, BaseProtocol {

    // MARK: - IBProperties
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel?
    var flowCoordinator: HomeFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .systemBackground
        self.addEditButton()
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            default: ()
            }
        })
        
    }
    
    func addEditButton() {
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .edit,
                                                            action: #selector(editButtonTapped),
                                                            target: self)])
    }
    
    @objc func editButtonTapped() {
        print("Edit")
    }

}

struct Home {
    enum RoutingEnum {
        case test
    }
}
