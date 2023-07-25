//
//  ProfileViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit

class ProfileViewController: UIViewController, BaseProtocol {

    // MARK: - IBProperties
    
    @IBOutlet weak var logoutButton: UIButton! {
        didSet {
            logoutButton.backgroundColor = .clear
            logoutButton.setTitleColor(.App.mainText, for: .normal)
            logoutButton.setTitle("Profile_logoutButton".getLocalized(), for: .normal)
        }
    }
    
    // MARK: - Properties
    
    var viewModel: ProfileViewModel?
    var flowCoordinator: ProfileFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .systemBackground
        self.addSettingsButton()
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            default: ()
            }
        })
        
    }
    
    func addSettingsButton() {
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .settings,
                                                            action: #selector(settingsButtonTapped),
                                                            target: self)])
    }
    
    @objc func settingsButtonTapped() {
        print("Settings")
    }
    
    // MARK: - IBActions
    
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        self.viewModel?.executeProfileLogoutUseCase()
    }
    
}

struct Profile {
    enum RoutingEnum {
        case test
    }
}
