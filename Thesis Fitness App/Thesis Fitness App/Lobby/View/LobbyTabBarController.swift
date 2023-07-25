//
//  LobbyTabBarController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit

class LobbyTabBarController: UITabBarController, BaseProtocol {

    // MARK: - IBProperties
    
    // MARK: - Properties
    
    var viewModel: LobbyViewModel?
    var flowCoordinator: LobbyFlowCoordinator?
    
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
        
        self.tabBar.backgroundColor = .systemGray5
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.tintColor = .App.mainText
        
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            default: ()
            }
        })
        
    }

}

struct Lobby {
    enum RoutingEnum {
        case test
    }
}
