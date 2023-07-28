//
//  ActivityParameterViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 29/7/23.
//

import Foundation

class ActivityParameterViewModel: BaseViewModelProtocol {

    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<ActivityParameter.RoutingEnum?>(value: nil)
    //var activityData = Observable<[ActivityCollectionViewModel]>(value: [])
    
    // MARK: - Properties
    
    var activityId: String
    
    var activityParameterSetupUseCase: ActivityParameterSetupUseCaseProtocol
    
    // MARK: - Life cycle
    
    init(activityId: String, activityParameterSetupUseCase: ActivityParameterSetupUseCaseProtocol) {
        self.activityId = activityId
        self.activityParameterSetupUseCase = activityParameterSetupUseCase
    }
    
    // MARK: - Methods
    
    func update(routing: ActivityParameter.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
    func executeActivityParameterSetupuseCase() {
        self.activityParameterSetupUseCase.execute()
    }
}
