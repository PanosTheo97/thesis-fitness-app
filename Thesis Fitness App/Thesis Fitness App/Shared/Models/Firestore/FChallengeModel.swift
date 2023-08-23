//
//  FChallengeModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import ObjectMapper

class FChallengeModel: Mappable {
    
    // MARK: - Properties
    
    var activityId: String?
    var activityName: String?
    var goal: FGoalModel?
    
    // MARK: - Life cycle
    
    required init?(map: Map) { }
    
    init(activityId: String?, activityName: String?, goal: FGoalModel?) {
        self.activityId = activityId
        self.activityName = activityName
        self.goal = goal
    }
    
    // MARK: - Methods
    
    func mapping(map: Map) {
        activityId <- map["activityId"]
        activityName <- map["activityName"]
        goal <- map["goal"]
    }
}
