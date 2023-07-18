//
//  WelcomeViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import UIKit
import GoogleSignIn

class WelcomeViewController: UIViewController, BaseProtocol {
    
    // MARK: IBProperties
    
    @IBOutlet weak var logoImageView: UIImageView! {
        didSet {
            logoImageView.contentMode = .scaleAspectFit
            logoImageView.image = UIImage.get(image: .AppLogo)
        }
    }
    
    @IBOutlet weak var welcomeLabel: UILabel! {
        didSet {
            welcomeLabel.textColor = .systemGray
            welcomeLabel.text = "Welcome"
            welcomeLabel.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    @IBOutlet weak var googleSignInButtonView: GIDSignInButton! {
        didSet {
            googleSignInButtonView.style = .wide
            googleSignInButtonView.colorScheme = .dark
        }
    }
     
    @IBOutlet weak var guestButton: UIButton! {
        didSet {
            guestButton.backgroundColor = .clear
            guestButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .clear,
                                                             textColor: .systemGray,
                                                             text: "Or continue as Guest",
                                                             font: .systemFont(ofSize: 20, weight: .bold)))
        }
    }
    
    // MARK: - Properties
    
    var viewModel: WelcomeViewModelProtocol?
    var flowCoordinator: WelcomeFlowCoordinatorProtocol?
    
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
            case .test:
                return
            default: ()
            }
        })
        
    }

}

struct Welcome {
    enum RoutingEnum {
        case test
    }
}
