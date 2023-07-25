//
//  LobbyFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class LobbyFlowCoordinator: BaseFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var lobbyDIContainer: LobbyDIContainer
    
    weak var lobbyViewController: LobbyTabBarController?
    
    // MARK: - Life cycle
    
    init(lobbyDIContainer: LobbyDIContainer, lobbyViewController: LobbyTabBarController?) {
        self.lobbyDIContainer = lobbyDIContainer
        self.lobbyViewController = lobbyViewController
    }
    
    // MARK: - Methods

}
