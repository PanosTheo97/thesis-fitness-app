//
//  MacrosViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/8/23.
//

import Foundation

class MacrosViewModel: BaseViewModelProtocol {
    
    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<Macros.RoutingEnum?>(value: nil)
    
    var updatedDietData = Observable<[DietModel]>(value: [])
    
    // MARK: - Properties
    
    var dietModels: [DietModel]
    
    // MARK: - Life cycle
    
    init(dietModels: [DietModel]) {
        self.dietModels = dietModels
    }
    
    // MARK: - Methods
    
    func update(routing: Macros.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
    func addMacros(caloriesValue: String?, proteinValue: String?, carbsValue: String?, fatsValue: String?, waterValue: String?) {
        var caloriesConsumed: Int = 0
        var proteinConsumed: Int = 0
        var carbsConsumed: Int = 0
        var fatsConsumed: Int = 0
        var waterConsumed: Int = 0
        
        self.dietModels.forEach { model in
            switch model.macroTypeEnum {
            case .calories:
                caloriesConsumed = model.consumedQuantity
                guard let calories = caloriesValue, !calories.isEmpty else {
                    return
                }
                caloriesConsumed = model.consumedQuantity + (Int(calories) ?? 0)
            case .carbonhydrates:
                carbsConsumed = model.consumedQuantity
                guard let carbs = carbsValue, !carbs.isEmpty else {
                    return
                }
                carbsConsumed = model.consumedQuantity + (Int(carbs) ?? 0)
            case .protein:
                proteinConsumed = model.consumedQuantity
                guard let protein = proteinValue, !protein.isEmpty else {
                    return
                }
                proteinConsumed = model.consumedQuantity + (Int(protein) ?? 0)
            case .water:
                waterConsumed = model.consumedQuantity
                guard let water = waterValue, !water.isEmpty else {
                    return
                }
                waterConsumed = model.consumedQuantity + (Int(water) ?? 0)
            case .fats:
                fatsConsumed = model.consumedQuantity
                guard let fats = fatsValue, !fats.isEmpty else {
                    return
                }
                fatsConsumed = model.consumedQuantity + (Int(fats) ?? 0)
            }
        }
        
        self.updatedDietData.value = [DietModel(macroTypeEnum: .calories,
                                     maxQuantity: 3000,
                                     consumedQuantity: caloriesConsumed),
                           DietModel(macroTypeEnum: .protein,
                                     maxQuantity: 130,
                                     consumedQuantity: proteinConsumed),
                           DietModel(macroTypeEnum: .carbonhydrates,
                                     maxQuantity: 250,
                                     consumedQuantity: carbsConsumed),
                           DietModel(macroTypeEnum: .fats,
                                     maxQuantity: 40,
                                     consumedQuantity: fatsConsumed),
                           DietModel(macroTypeEnum: .water,
                                     maxQuantity: 4000,
                                     consumedQuantity: waterConsumed)]
    }
    
}
