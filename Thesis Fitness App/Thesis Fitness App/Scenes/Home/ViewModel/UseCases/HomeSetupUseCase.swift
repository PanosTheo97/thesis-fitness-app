//
//  HomeSetupUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 24/8/23.
//

import Foundation

protocol HomeSetupUseCaseProtocol: AnyObject {
    func execute(completion: @escaping (UserModel?) -> Void)
}

class HomeSetupUseCase: HomeSetupUseCaseProtocol {
    
    func execute(completion: @escaping (UserModel?) -> Void) {
        guard let documentId = AccountManager.shared.userDocimentId else {
            completion(nil)
            return
        }
        NetworkManager.getDocument(FUserModel.self, .users, documentId) { result in
            switch result {
            case .success(let user):
                completion(UserModel(from: user))
            case .failure:
                completion(nil)
            }
        }
    }
}
