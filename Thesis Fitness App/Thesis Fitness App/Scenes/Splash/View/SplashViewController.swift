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
            logoImageView.image = UIImage.init(systemName: "heart.fill")
        }
    }
    
    // MARK: - Properties
    
    var viewModel: SplashViewModel?
    var flowCoordinator: SplashFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.viewModel?.update(routing: .home)
    }

    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .App.lightGray
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            case .home:
                self?.flowCoordinator?.moveToHome()
            default: ()
            }
        })
        
    }
}

struct Splash {
    enum RoutingEnum {
        case home
    }
}
