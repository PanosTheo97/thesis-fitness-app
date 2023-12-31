//
//  SplashViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import UIKit

class SplashViewController: UIViewController, BaseProtocol {

    // MARK: - IBProperties
    
    @IBOutlet weak var logoImageView: UIImageView! {
        didSet {
            logoImageView.contentMode = .scaleAspectFit
            logoImageView.image = UIImage.get(image: .AppLogo)
        }
    }
    
    // MARK: - Properties
    
    var viewModel: SplashViewModel?
    var flowCoordinator: SplashFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.viewModel?.executeSplashCheckForUserUseCase()
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
            case .welcome:
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self?.flowCoordinator?.moveToWelcome()
                })
            case .lobby:
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self?.flowCoordinator?.moveToLobby()
                })
            default: ()
            }
        })
        
    }
}

struct Splash {
    enum RoutingEnum {
        case welcome
        case lobby
    }
}
