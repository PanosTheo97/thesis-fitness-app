//
//  WelcomeCheckForRegisteredUserUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 24/8/23.
//

import Foundation

protocol CheckForRegistereduserUseCaseProtocol: AnyObject {
    func execute(completion: @escaping (Bool?) -> Void)
}

class CheckForRegistereduserUseCase: CheckForRegistereduserUseCaseProtocol {
    
    func execute(completion: @escaping (Bool?) -> Void) {
        // Get all users
        NetworkManager.getDocuments(FUserModel.self, .users) { result in
            switch result {
            case .success((let users, let ids)):
                if let registeredUserIndex = users.firstIndex(where: { $0.email == AccountManager.shared.user?.email }) {
                    AccountManager.shared.userDocimentId = ids[registeredUserIndex]
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
