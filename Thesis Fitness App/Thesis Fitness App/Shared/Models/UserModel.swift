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
    
    // MARK: - LifeCycle
    
    init(name: String, bodyweight: String, musclePercentage: String?, fatPercentage: String?, dailyStepGoal: Int?, dailyCalorieBurnGoal: Int?) {
        self.name = name
        self.bodyweight = bodyweight
        self.musclePercentage = musclePercentage
        self.fatPercentage = fatPercentage
        self.dailyStepGoal = dailyStepGoal
        self.dailyCalorieBurnGoal = dailyCalorieBurnGoal
    }
    
}
