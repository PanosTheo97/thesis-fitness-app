//
//  WelcomeViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import UIKit
import GoogleSignIn
import FirebaseCore

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
            welcomeLabel.textColor = .App.mainText
            welcomeLabel.text = "Welcome_welcomeLabel".getLocalized()
            welcomeLabel.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    @IBOutlet weak var googleSignInButtonView: UIView! {
        didSet {
            googleSignInButtonView.backgroundColor = .clear
            googleSignInButtonView.layer.cornerRadius = 8
            googleSignInButtonView.layer.borderColor = UIColor.App.mainText.cgColor
            googleSignInButtonView.layer.borderWidth = 1.5
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            googleSignInButtonView.addGestureRecognizer(tap)
        }
    }
    
    @IBOutlet weak var googleImageView: UIImageView! {
        didSet {
            googleImageView.contentMode = .scaleAspectFit
            googleImageView.image = UIImage.get(image: .Google)
        }
    }
    
    @IBOutlet weak var googleSignInLabel: UILabel! {
        didSet {
            googleSignInLabel.textColor = .App.mainText
            googleSignInLabel.text = "Welcome_googleSignInLabel".getLocalized()
            googleSignInLabel.font = .systemFont(ofSize: 16, weight: .bold)
        }
    }
    
    @IBOutlet weak var guestButton: UIButton! {
        didSet {
            guestButton.backgroundColor = .clear
            guestButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .clear,
                                                             textColor: .App.mainText,
                                                             text: "Welcome_guestButton".getLocalized(),
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
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            print("No client ID")
            return
        }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { googleUser, error in
            if let googleUser = googleUser {
                print(googleUser)
            } else {
                print(error)
            }
        }
    }

}

struct Welcome {
    enum RoutingEnum {
        case test
    }
}
