//
//  ActivityUpdateFavoritesUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 24/8/23.
//

import Foundation

protocol ActivityUpdateFavoritesUseCaseProtocol: AnyObject {
    func execute(favoriteActivities: [ActivityEnum], completion: @escaping ([String]?) -> Void)
}

class ActivityUpdateFavoritesUseCase: ActivityUpdateFavoritesUseCaseProtocol {
    
    func execute(favoriteActivities: [ActivityEnum], completion: @escaping ([String]?) -> Void) {
        var newFavoriteIds: [String] = []
        favoriteActivities.forEach { activity in
            newFavoriteIds.append(activity.getActivityId())
        }
        
        NetworkManager.updateDocument(with: ["favoriteActivitiesIds": newFavoriteIds], .users, AccountManager.shared.userDocimentId ?? "") { result in
            switch result {
            case .success:
                completion(newFavoriteIds)
            case .failure:
                print("ERROR UPDATING")
                completion(nil)
            }
        }
    }
}
