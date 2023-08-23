//
//  FDietModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import ObjectMapper

class FDietModel: Mappable {
    
    // MARK: - Properties
    
    var calories: Double?
    var carbohydrates: Double?
    var fats: Double?
    var protein: Double?
    var water: Double?
  
    // MARK: - Life cycle
    
    required init?(map: Map) { }
    
    init(calories: Double?, carbohydrates: Double?, fats: Double?, protein: Double?, water: Double?) {
        self.calories = calories
        self.carbohydrates = carbohydrates
        self.fats = fats
        self.protein = protein
        self.calories = calories
    }
    
    // MARK: - Methods
    
    func mapping(map: Map) {
        calories <- map["calories"]
        carbohydrates <- map["carbohydrates"]
        fats <- map["fats"]
        protein <- map["protein"]
        water <- map["water"]
    }
}
