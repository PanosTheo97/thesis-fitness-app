//
//  ActivitySessionViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 2/8/23.
//

import Foundation

class ActivitySessionViewModel: BaseViewModelProtocol {
    
    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<ActivitySession.RoutingEnum?>(value: nil)
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    
    init() {
    }
    
    // MARK: - Methods
    
    func update(routing: ActivitySession.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
}
