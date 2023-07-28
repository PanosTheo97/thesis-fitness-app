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
    var activityData = Observable<[ActivityCollectionViewModel]>(value: [])
    
    // MARK: - Properties
    
    var activitySetupUseCase: ActivitySetupUseCaseProtocol
    
    // MARK: - Life cycle
    
    init(activitySetupUseCase: ActivitySetupUseCaseProtocol) {
        self.activitySetupUseCase = activitySetupUseCase
    }
    
    // MARK: - Methods
    
    func update(routing: Activity.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
    func executeActivitySetupuseCase() {
        self.activitySetupUseCase.execute { data in
            self.activityData.value = data
        }
    }
}
