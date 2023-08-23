//
//  FActivityDoneModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import ObjectMapper

class FActivityDoneModel: Mappable {
    
    // MARK: - Properties
    
    var activityId: String?
    var breakTime: Double?
    var activityStatistics: [FActivityStatisticModel]?
  
    // MARK: - Life cycle
    
    required init?(map: Map) { }
    
    init(activityId: String?, breakTime: Double?, activityStatistics: [FActivityStatisticModel]?) {
        self.activityId = activityId
        self.breakTime = breakTime
        self.activityStatistics =  activityStatistics
    }
    
    // MARK: - Methods
    
    func mapping(map: Map) {
        activityId <- map["activityId"]
        breakTime <- map["breakTime"]
        activityStatistics <- map["activityStatistics"]
    }
}
