//
//  DietViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class DietModel {
#warning("Dummy Model, will change on database implementation")
    
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

class DietViewModel: BaseViewModelProtocol {
    
    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<Diet.RoutingEnum?>(value: nil)
    
    var dietData = Observable<[DietModel]>(value: [])
    
    // MARK: - Life cycle
    
    init() {
        
    }
    
    func setup() {
        self.dietData.value = [DietModel(macroTypeEnum: .calories,
                                         maxQuantity: 3000,
                                         consumedQuantity: 700),
                               DietModel(macroTypeEnum: .protein,
                                         maxQuantity: 130,
                                         consumedQuantity: 35),
                               DietModel(macroTypeEnum: .carbonhydrates,
                                         maxQuantity: 250,
                                         consumedQuantity: 200),
                               DietModel(macroTypeEnum: .fats,
                                         maxQuantity: 40,
                                         consumedQuantity: 1),
                               DietModel(macroTypeEnum: .water,
                                         maxQuantity: 4000,
                                         consumedQuantity: 3577)]
    }
    
    func update(routing: Diet.RoutingEnum) {
        self.routingEnum.value = routing
    }
}
