//
//  SplashCheckForUserUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

protocol SplashCheckForUserUseCaseProtocol: AnyObject {
    func execute(completion: @escaping (Bool) -> Void)
}

class SplashCheckForUserUseCase: SplashCheckForUserUseCaseProtocol {
    
    func execute(completion: @escaping (Bool) -> Void) {
        AccountManager.shared.checkForSignedInUser { isSignedInUser in
            completion(isSignedInUser)
        }
    }
}
