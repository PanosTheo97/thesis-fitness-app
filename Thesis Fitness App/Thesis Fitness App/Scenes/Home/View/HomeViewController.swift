//
//  HomeViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit

class HomeViewController: UIViewController, BaseProtocol {

    // MARK: - IBProperties
    
    @IBOutlet weak var displayNameLabel: UILabel! {
        didSet {
            displayNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
            displayNameLabel.textColor = .App.mainText
            displayNameLabel.isHidden = true
        }
    }
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
        
        if let name = AccountManager.shared.user?.displayName {
            self.displayNameLabel.text = String(format: "Home_displayNameLabel".getLocalized(), name)
            self.displayNameLabel.isHidden = false
        }
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
