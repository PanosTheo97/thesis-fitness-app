//
//  ActivitySessionSetupUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 5/8/23.
//

import Foundation

protocol ActivitySessionSetupUseCaseProtocol: AnyObject {
    func execute(completion: @escaping (Bool) -> Void)
}

class ActivitySessionSetupUseCase: ActivitySessionSetupUseCaseProtocol {
    
    func execute(completion: @escaping (Bool) -> Void) {
        // Check if activity should show map
        completion(true)
    }
}
