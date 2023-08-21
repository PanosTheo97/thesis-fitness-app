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
    var favoriteActivities: [ActivityEnum] = []
    
    // MARK: - Life cycle
    
    init(activitySetupUseCase: ActivitySetupUseCaseProtocol, favoriteActivities: [ActivityEnum]) {
        self.activitySetupUseCase = activitySetupUseCase
        self.favoriteActivities = favoriteActivities
    }
    
    // MARK: - Methods
    
    func update(routing: Activity.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
    func executeActivitySetupuseCase() {
        self.activitySetupUseCase.execute(favoriteActivities: favoriteActivities) { data in
            self.activityData.value = data
        }
    }
}
