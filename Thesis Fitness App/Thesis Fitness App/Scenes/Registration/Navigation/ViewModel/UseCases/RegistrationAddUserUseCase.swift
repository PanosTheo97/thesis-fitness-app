//
//  RegistrationAddUserUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import UIKit

protocol RegistrationAddUserUseCaseProtocol: AnyObject {
    func execute(user: FUserModel, completion: @escaping (String?) -> Void)
}

class RegistrationAddUserUseCase: RegistrationAddUserUseCaseProtocol {
    
    func execute(user: FUserModel, completion: @escaping (String?) -> Void) {
        NetworkManager.addDocument(user, .users) { result in
            switch result {
            case .success(let documentRefference):
                completion(documentRefference?.documentID)
            case .failure:
                AccountManager.shared.signOut { _ in }
                completion(nil)
            }
        }
    }
}
