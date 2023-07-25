//
//  ProfileLogoutUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

protocol ProfileLogoutUseCaseProtocol: AnyObject {
    func execute(completion: @escaping (Bool) -> Void)
}

class ProfileLogoutUseCase: ProfileLogoutUseCaseProtocol {
    
    func execute(completion: @escaping (Bool) -> Void) {
        AccountManager.shared.signOut() { successfulLogout in
            completion(successfulLogout)
        }
    }
}
