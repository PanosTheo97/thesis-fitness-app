//
//  DietModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 24/8/23.
//

import Foundation

class DietModel {
    
    // MARK: - Properties
    
    var macroTypeEnum: MacroTypeEnum
    var maxQuantity: Int
    var consumedQuantity: Int
    
    init(macroTypeEnum: MacroTypeEnum, maxQuantity: Int, consumedQuantity: Int) {
        self.macroTypeEnum = macroTypeEnum
        self.maxQuantity = maxQuantity
        self.consumedQuantity = consumedQuantity
    }
    
    
}
