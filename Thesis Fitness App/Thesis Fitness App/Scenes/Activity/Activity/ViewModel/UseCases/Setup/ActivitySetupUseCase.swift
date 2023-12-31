//
//  ActivitySetupUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 26/7/23.
//

import Foundation

protocol ActivitySetupUseCaseProtocol: AnyObject {
    func execute(favoriteActivities: [ActivityEnum], completion: @escaping ([ActivityCollectionViewModel]) -> Void)
}

class ActivitySetupUseCase: ActivitySetupUseCaseProtocol {
    
    func execute(favoriteActivities: [ActivityEnum], completion: @escaping ([ActivityCollectionViewModel]) -> Void) {
        
        var activityModels: [ActivityCollectionViewModel] = []
        for activity in ActivityEnum.allCases {
            activityModels.append(ActivityCollectionViewModel(type: activity,
                                                              isFavorite: favoriteActivities.contains(activity)))
        }
        completion(activityModels)
    }
}
