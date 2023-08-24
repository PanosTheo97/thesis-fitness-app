//
//  UserDietModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 24/8/23.
//

import Foundation

class UserDietModel {
    
    // MARK: - Properties
    
    var calories: Double?
    var carbohydrates: Double?
    var fats: Double?
    var protein: Double?
    var water: Double?
  
    // MARK: - Life cycle
    
    init(calories: Double?, carbohydrates: Double?, fats: Double?, protein: Double?, water: Double?) {
        self.calories = calories
        self.carbohydrates = carbohydrates
        self.fats = fats
        self.protein = protein
        self.calories = calories
    }
    
    init(from fDietModel: FDietModel?) {
        self.calories = fDietModel?.calories
        self.carbohydrates = fDietModel?.carbohydrates
        self.fats = fDietModel?.fats
        self.protein = fDietModel?.protein
        self.calories = fDietModel?.calories
    }
    
}
