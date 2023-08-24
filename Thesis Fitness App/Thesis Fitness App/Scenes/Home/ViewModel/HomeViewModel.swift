//
//  HomeViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

class HomeViewModel: BaseViewModelProtocol {

    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<Home.RoutingEnum?>(value: nil)
    var user = Observable<UserModel?>(value: nil)
   
    
    // MARK: - Properties
    
    var homeSetupUseCase: HomeSetupUseCaseProtocol
    
    // MARK: - Life cycle
    
    init(homeSetupUseCase: HomeSetupUseCaseProtocol) {
        self.homeSetupUseCase = homeSetupUseCase
    }
    
    // MARK: - Methods
    
    func update(routing: Home.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
    func executeHomeSetupUseCase() {
        self.isLoading.value = true
        self.homeSetupUseCase.execute { user in
            self.isLoading.value = false
            self.user.value = user
        }
    }
}
