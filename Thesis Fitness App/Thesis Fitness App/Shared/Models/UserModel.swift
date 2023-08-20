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
    var bodyweight: String
    var musclePercentage: String?
    var fatPercentage: String?
    var dailyStepGoal: Int?
    var dailyCalorieBurnGoal: Int?
    var favoriteActivities: [ActivityEnum]
    var calorieGoal: String?
    var proteinGoal: String?
    var carbGoal: String?
    var fatsGoal: String?
    var waterGoal: String?
    
    // MARK: - LifeCycle
    
    init(name: String, bodyweight: String, favoriteActivities: [ActivityEnum]) {
        self.name = name
        self.bodyweight = bodyweight
        self.favoriteActivities = favoriteActivities
    }
    
}
