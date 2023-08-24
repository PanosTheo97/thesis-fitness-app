//
//  LobbyViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class LobbyViewModel: BaseViewModelProtocol {

    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<Lobby.RoutingEnum?>(value: nil)
    
    // MARK: - Properties
    
    var user: UserModel?
    
    // MARK: - Life cycle
    
    init() {
        
    }
    
    func update(routing: Lobby.RoutingEnum) {
        self.routingEnum.value = routing
    }
}
