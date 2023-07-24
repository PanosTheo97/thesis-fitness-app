//
//  WelcomeSignInUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

protocol WelcomeSignInUseCaseProtocol: AnyObject {
    func execute(completion: @escaping (Bool) -> Void)
}

class WelcomeSignInUseCase: WelcomeSignInUseCaseProtocol {
    
    func execute(completion: @escaping (Bool) -> Void) {
        AccountManager.shared.signIn { successfulSignIn in
            completion(successfulSignIn)
        }
    }
}
