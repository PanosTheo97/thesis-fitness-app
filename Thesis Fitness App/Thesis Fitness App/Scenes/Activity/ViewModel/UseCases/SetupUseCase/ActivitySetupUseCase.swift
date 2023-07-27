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
        let activityModels: [ActivityCollectionViewModel] = [ActivityCollectionViewModel(activityImage: .init(systemName: "figure.run"),
                                                                                         activityName: "Running",
                                                                                         isFavorite: false),
                                                             ActivityCollectionViewModel(activityImage: .init(systemName: "figure.climbing"),
                                                                                         activityName: "Climbing",
                                                                                         isFavorite: false),
                                                             ActivityCollectionViewModel(activityImage: .init(systemName: "figure.outdoor.cycle"),
                                                                                         activityName: "Cycling",
                                                                                         isFavorite: false),
                                                             ActivityCollectionViewModel(activityImage: .init(systemName: "figure.indoor.cycle"),
                                                                                         activityName: "Indoor Running",
                                                                                         isFavorite: true),
                                                             ActivityCollectionViewModel(activityImage: .init(systemName: "figure.walk"),
                                                                                         activityName: "Walking",
                                                                                         isFavorite: false),
                                                             ActivityCollectionViewModel(activityImage: .init(systemName: "figure.basketball"),
                                                                                         activityName: "Basketball",
                                                                                         isFavorite: false),
                                                             ActivityCollectionViewModel(activityImage: .init(systemName: "figure.jumprope"),
                                                                                         activityName: "Jumping Rope",
                                                                                         isFavorite: true),
                                                             ActivityCollectionViewModel(activityImage: .init(systemName: "figure.soccer"),
                                                                                         activityName: "Football",
                                                                                         isFavorite: true),
                                                             ActivityCollectionViewModel(activityImage: .init(systemName: "figure.boxing"),
                                                                                         activityName: "Boxing",
                                                                                         isFavorite: false),
                                                             ActivityCollectionViewModel(activityImage: .init(systemName: "tennis.racket"),
                                                                                         activityName: "Ping Pong",
                                                                                         isFavorite: false)]
        completion(activityModels)
    }
}
