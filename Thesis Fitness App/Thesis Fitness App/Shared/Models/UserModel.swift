//
//  UserModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation

class UserModel {
    
    // MARK: - Properties
    
    var name: String
    
    var bodyweight: Double
    var musclePercentage: Double?
    var fatPercentage: Double?
    
    var dailyStepGoal: Int?
    var dailyCalorieBurnGoal: Int?
    
    var favoriteActivities: [ActivityEnum] = []
    
    var userDietModel: UserDietModel?
    
    // MARK: - LifeCycle
    
    init(name: String, bodyweight: Double, favoriteActivities: [ActivityEnum]) {
        self.name = name
        self.bodyweight = bodyweight
        self.favoriteActivities = favoriteActivities
    }
    
    init(from fUserModel: FUserModel) {
        self.name = fUserModel.name ?? ""
        
        self.bodyweight = fUserModel.bodyweight ?? 0
        self.musclePercentage = fUserModel.muscleMassPercentage
        self.fatPercentage = fUserModel.bodyFatPercentage
                
        self.dailyStepGoal = fUserModel.dailyStepsGoal
        self.dailyCalorieBurnGoal = fUserModel.dailyCaloricBurnGoal
        
        fUserModel.favoriteActivitiesID?.forEach({ activityId in
            if let activity = ActivityEnum.init(string: activityId) {
                self.favoriteActivities.append(activity)
            }
        })
        
        if let dietJson = fUserModel.dietGoal {
            self.userDietModel = UserDietModel(from: FDietModel(JSON: dietJson))
        }
        
        
        
    }
    
}


