//
//  WelcomeViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import Foundation
protocol WelcomeViewModelProtocol: BaseViewModelProtocol {
    
    // MARK: - Properties
    
    
    // MARK: - Observables
    
    var routingEnum: Observable<Welcome.RoutingEnum?> { get }

    // MARK: - Methods
    
    func update(routingEnum: Welcome.RoutingEnum?)
    
}

class WelcomeViewModel: WelcomeViewModelProtocol {
    
    // MARK: - Observables
    
    var routingEnum = Observable<Welcome.RoutingEnum?>(value: nil)
    var isLoading = Observable<Bool?>(value: nil)
    
    
    // MARK: - Methods
    
    func update(routingEnum: Welcome.RoutingEnum?) {
        self.routingEnum.value = routingEnum
    }
    
}
