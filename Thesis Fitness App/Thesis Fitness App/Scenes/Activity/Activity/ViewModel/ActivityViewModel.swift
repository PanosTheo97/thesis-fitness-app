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
    var updatedFavorites = Observable<[ActivityEnum]?>(value: nil)
    
    // MARK: - Properties
    
    var activitySetupUseCase: ActivitySetupUseCaseProtocol
    var activityUpdateFavoritesUseCase: ActivityUpdateFavoritesUseCaseProtocol
    
    // MARK: - Life cycle
    
    init(activitySetupUseCase: ActivitySetupUseCaseProtocol, activityUpdateFavoritesUseCase: ActivityUpdateFavoritesUseCaseProtocol) {
        self.activitySetupUseCase = activitySetupUseCase
        self.activityUpdateFavoritesUseCase = activityUpdateFavoritesUseCase
    }
    
    // MARK: - Methods
    
    func update(routing: Activity.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
    func executeActivitySetupUseCase(favoriteActivities: [ActivityEnum]) {
        self.activitySetupUseCase.execute(favoriteActivities: favoriteActivities) { data in
            self.activityData.value = data
        }
    }
    
    func executeActivityUpdateFavoritesUseCase(activities: [ActivityCollectionViewModel]) {
        var favoriteActivities: [ActivityEnum] = []
        activities.forEach { activity in
            if activity.isFavorite { favoriteActivities.append(activity.type) }
        }
        
        self.activityUpdateFavoritesUseCase.execute(favoriteActivities: favoriteActivities) { _ in
            self.updatedFavorites.value = favoriteActivities
        }
    }
}
