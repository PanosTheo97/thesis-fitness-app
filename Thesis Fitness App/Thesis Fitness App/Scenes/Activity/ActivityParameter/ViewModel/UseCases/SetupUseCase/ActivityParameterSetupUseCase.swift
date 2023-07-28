//
//  ActivityParameterSetupUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 29/7/23.
//

import Foundation
protocol ActivityParameterSetupUseCaseProtocol: AnyObject {
    func execute()
}

class ActivityParameterSetupUseCase: ActivityParameterSetupUseCaseProtocol {
    
    func execute() {
        // Service, fetchActivity based on Id, completion with activityModel
    }
}
