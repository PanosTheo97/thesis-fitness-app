//
//  WorkoutViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class WorkoutViewModel: BaseViewModelProtocol {

    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<Workout.RoutingEnum?>(value: nil)
    
    // MARK: - Life cycle
    
    init() {
        
    }
    
    func update(routing: Workout.RoutingEnum) {
        self.routingEnum.value = routing
    }
}
