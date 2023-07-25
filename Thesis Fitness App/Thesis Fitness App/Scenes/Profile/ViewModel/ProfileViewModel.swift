//
//  ProfileViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class ProfileViewModel: BaseViewModelProtocol {

    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<Profile.RoutingEnum?>(value: nil)
    
    // MARK: - Properties
    
    var profileLogoutUseCase: ProfileLogoutUseCaseProtocol
    
    // MARK: - Life cycle
    
    init(profileLogoutUseCase: ProfileLogoutUseCaseProtocol) {
        self.profileLogoutUseCase = profileLogoutUseCase
    }
    
    func update(routing: Profile.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
    func executeProfileLogoutUseCase() {
        self.profileLogoutUseCase.execute { successfulLogout in
            self.update(routing: .welcome)
        }
    }
}
