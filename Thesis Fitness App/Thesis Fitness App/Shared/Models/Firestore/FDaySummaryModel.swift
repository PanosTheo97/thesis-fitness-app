//
//  FDaySummaryModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import ObjectMapper

class FDaySummaryModel: Mappable {
    
    // MARK: - Properties
    
    var dailyDiet: FDietModel?
    var date: TimeInterval?
    
    // MARK: - Life cycle
    
    required init?(map: Map) { }
    
    init(dailyDiet: FDietModel?, date: TimeInterval?) {
        self.dailyDiet = dailyDiet
        self.date = date
    }
    
    // MARK: - Methods
    
    func mapping(map: Map) {
        dailyDiet <- map["dailyDiet"]
        date <- map["date"]
    }
}
