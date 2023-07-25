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
    
    // MARK: - Life cycle
    
    init() {
        
    }
    
    func update(routing: Home.RoutingEnum) {
        self.routingEnum.value = routing
    }
}
