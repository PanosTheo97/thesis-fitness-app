//
//  WelcomeCheckForRegisteredUserUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 24/8/23.
//

import Foundation

protocol WelcomeCheckForRegistereduserUseCaseProtocol: AnyObject {
    func execute(completion: @escaping (Bool?) -> Void)
}

class WelcomeCheckForRegistereduserUseCase: WelcomeCheckForRegistereduserUseCaseProtocol {
    
    func execute(completion: @escaping (Bool?) -> Void) {
        // Get all users
        NetworkManager.getDocuments(FUserModel.self, .users) { result in
            switch result {
            case .success(let users):
                if let registeredUser = users.first(where: { $0.email == AccountManager.shared.user?.email }) {
                    completion(true)
                } else {
                    completion(false)
                }
                
            case .failure:
                completion(nil)
            }
        }
    }
}
