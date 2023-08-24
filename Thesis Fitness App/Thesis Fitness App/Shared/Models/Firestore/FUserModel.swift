//
//  FUserModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 22/8/23.
//

import Foundation
import ObjectMapper

class FUserModel: Mappable {
    
    // MARK: - Properties
    
    var name: String?
    var email: String?
    var imgUrl: String?
    
    var bodyweight: Double?
    var muscleMassPercentage: Double?
    var bodyFatPercentage: Double?
    
    var dailyCaloricBurnGoal: Int?
    var dailyStepsGoal: Int?
    
    var challenges: [[String: Any]]? // FUserChallengeModel
    var dietGoal: [String: Any]? // FDietModel
    var favoriteActivitiesID: [String]?
    
    // MARK: - Life cycle
    
    required init?(map: Map) { }
    
    init(name: String?, email: String?) {
        self.name = name
        self.email = email
    }
    
    // MARK: - Methods
    
    func mapping(map: Map) {
        name <- map["name"]
        email <- map["email"]
        imgUrl <- map["imgUrl"]
        
        bodyweight <- map["bodyWeight"]
        muscleMassPercentage <- map["muscleMassPercent"]
        bodyFatPercentage <- map["bodyFatPercent"]
        
        dailyCaloricBurnGoal <- map["dailyCaloricBurnGoal"]
        dailyStepsGoal <- map["dailyStepsGoal"]
        
        challenges <- map["challenges"]
        dietGoal <- map["dietGoal"]
        favoriteActivitiesID <- map["favoriteActivitiesIds"]
    }
}
