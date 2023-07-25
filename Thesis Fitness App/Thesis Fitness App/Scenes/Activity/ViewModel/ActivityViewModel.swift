//
//  ActivityViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class ActivityViewModel: BaseViewModelProtocol {

    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<Activity.RoutingEnum?>(value: nil)
    
    // MARK: - Life cycle
    
    init() {
        
    }
    
    func update(routing: Activity.RoutingEnum) {
        self.routingEnum.value = routing
    }
}
