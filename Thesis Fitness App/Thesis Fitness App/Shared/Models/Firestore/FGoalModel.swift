//
//  FGoalModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import ObjectMapper

class FGoalModel: Mappable {
    
    // MARK: - Properties
    
    var type: String?
    var value: Double?
  
    // MARK: - Life cycle
    
    required init?(map: Map) { }
    
    init(type: String?, value: Double?) {
        self.type = type
        self.value = value
    }
    
    // MARK: - Methods
    
    func mapping(map: Map) {
        type <- map["type"]
        value <- map["value"]
    }
}
