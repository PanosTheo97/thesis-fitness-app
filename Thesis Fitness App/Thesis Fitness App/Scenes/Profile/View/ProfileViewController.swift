//
//  ProfileViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit

protocol ProfileViewControllerProtocol: AnyObject {
    func moveToWelcome()
}

class ProfileViewController: UIViewController, BaseProtocol {

    // MARK: - IBProperties
    
    @IBOutlet weak var bodyCompositionButton: UIButton! {
        didSet {
            bodyCompositionButton.backgroundColor = .clear
            bodyCompositionButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .clear,
                                                             textColor: .App.mainText,
                                                             text: "Profile_bodyCompositionButton".getLocalized(),
                                                             font: .systemFont(ofSize: 16, weight: .bold)))
        }
    }
    
    @IBOutlet weak var dailyMovementGoalsButton: UIButton! {
        didSet {
            dailyMovementGoalsButton.backgroundColor = .clear
            dailyMovementGoalsButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .clear,
                                                             textColor: .App.mainText,
                                                             text: "Profile_dailyMovementButton".getLocalized(),
                                                             font: .systemFont(ofSize: 16, weight: .bold)))
        }
    }
    
    @IBOutlet weak var dailyDietGoalsButton: UIButton! {
        didSet {
            dailyDietGoalsButton.backgroundColor = .clear
            dailyDietGoalsButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .clear,
                                                             textColor: .App.mainText,
                                                             text: "Profile_dailyDietButton".getLocalized(),
                                                             font: .systemFont(ofSize: 16, weight: .bold)))
        }
    }
    
    @IBOutlet weak var changeLanguageButton: UIButton! {
        didSet {
            changeLanguageButton.backgroundColor = .clear
            changeLanguageButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .clear,
                                                             textColor: .App.mainText,
                                                             text: "Profile_changeLanguageButton".getLocalized(),
                                                             font: .systemFont(ofSize: 16, weight: .bold)))
        }
    }
    
    @IBOutlet weak var logoutButton: UIButton! {
        didSet {
            logoutButton.backgroundColor = .clear
            logoutButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .clear,
                                                             textColor: .App.mainText,
                                                             text: "Profile_logoutButton".getLocalized(),
                                                             font: .systemFont(ofSize: 16, weight: .bold)))
        }
    }
    
    @IBOutlet weak var deleteAccountButton: UIButton! {
        didSet {
            deleteAccountButton.backgroundColor = .clear
            deleteAccountButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .clear,
                                                             textColor: .systemRed,
                                                             text: "Profile_deleteAccountButton".getLocalized(),
                                                             font: .systemFont(ofSize: 16, weight: .bold)))
        }
    }
    
    // MARK: - Properties
    
    var viewModel: ProfileViewModel?
    var flowCoordinator: ProfileFlowCoordinator?
    
    weak var profileViewControllerDelegate: ProfileViewControllerProtocol?
    
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
            case .welcome:
                self?.profileViewControllerDelegate?.moveToWelcome()
            default: ()
            }
        })
        
    }
    
    func addSettingsButton() {
        self.navigationItem.addTitle(title: "Lobby_profileTitle".getLocalized())
//        self.navigationItem.addButtons(barButtonPositionEnum: .right,
//                                       navigationButtons: [(navigationButtonTypeEnum: .settings,
//                                                            action: #selector(settingsButtonTapped),
//                                                            target: self)])
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
        case welcome
    }
}
