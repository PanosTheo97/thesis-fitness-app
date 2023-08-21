//
//  HomeViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class HomeViewModel: BaseViewModelProtocol {

    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<Home.RoutingEnum?>(value: nil)
    
    var user: UserModel
    
    // MARK: - Life cycle
    
    init(user: UserModel) {
        self.user = user
    }
    
    func update(routing: Home.RoutingEnum) {
        self.routingEnum.value = routing
    }
}
