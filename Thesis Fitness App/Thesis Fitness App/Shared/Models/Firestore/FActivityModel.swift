//
//  FActivityModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import ObjectMapper

class FActivityModel: Mappable {
    
    // MARK: - Properties
    
    var name: String?
    var parameters: [String]?
  
    // MARK: - Life cycle
    
    required init?(map: Map) { }
    
    init(name: String?, parameters: [String]?) {
        self.name = name
        self.parameters = parameters
    }
    
    // MARK: - Methods
    
    func mapping(map: Map) {
        name <- map["name"]
        parameters <- map["parameters"]
    }
}
