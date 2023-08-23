//
//  FActivityStatisticModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import ObjectMapper

class FActivityStatisticModel: Mappable {
    
    // MARK: - Properties
    
    var type: String?
    var value: Double?
    var achieved: Bool?
  
    // MARK: - Life cycle
    
    required init?(map: Map) { }
    
    init(type: String?, value: Double?, achieved: Bool?) {
        self.type = type
        self.value = value
        self.achieved =  achieved
    }
    
    // MARK: - Methods
    
    func mapping(map: Map) {
        type <- map["name"]
        value <- map["value"]
        achieved <- map["achieved"]
    }
}
