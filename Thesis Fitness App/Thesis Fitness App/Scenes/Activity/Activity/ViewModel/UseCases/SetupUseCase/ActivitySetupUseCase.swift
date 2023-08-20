//
//  ActivitySetupUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 26/7/23.
//

import Foundation
import UIKit

protocol ActivitySetupUseCaseProtocol: AnyObject {
    func execute(completion: @escaping ([ActivityCollectionViewModel]) -> Void)
}

class ActivitySetupUseCase: ActivitySetupUseCaseProtocol {
    
    func execute(completion: @escaping ([ActivityCollectionViewModel]) -> Void) {
        // Service, fetch, completion with enum
        // For now, dummy data
        
        var activityModels: [ActivityCollectionViewModel] = []
        
        for activity in ActivityEnum.allCases {
            activityModels.append(ActivityCollectionViewModel(type: activity, isFavorite: false))
        }
        completion(activityModels)
    }
}
