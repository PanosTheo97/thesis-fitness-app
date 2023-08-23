//
//  FUserChallengeModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import ObjectMapper

class FUserChallengeModel: Mappable {
    
    // MARK: - Properties
    
    var activityId: String?
    var activityName: String?
    var challengeId: String?
    var goal: FGoalModel?
    var progress: Double?
    
    // MARK: - Life cycle
    
    required init?(map: Map) { }
    
    init(activityId: String?, activityName: String?, challengeId: String?, goal: FGoalModel?, progress: Double?) {
        self.activityId = activityId
        self.activityName = activityName
        self.challengeId = challengeId
        self.goal = goal
        self.progress = progress
    }
    
    // MARK: - Methods
    
    func mapping(map: Map) {
        activityId <- map["activityId"]
        activityName <- map["activityName"]
        challengeId <- map["challengeId"]
        goal <- map["goal"]
        progress <- map["progress"]
    }
}
