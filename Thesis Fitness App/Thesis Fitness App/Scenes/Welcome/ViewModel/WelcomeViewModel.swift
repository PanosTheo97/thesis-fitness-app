//
//  WelcomeViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import Foundation
protocol WelcomeViewModelProtocol: BaseViewModelProtocol {
    
    
    // MARK: - Observables
    
    var routingEnum: Observable<Welcome.RoutingEnum?> { get }

    // MARK: - Methods
    
    func update(routingEnum: Welcome.RoutingEnum?)
    func executeWelcomeSignInUseCase()
    
}

class WelcomeViewModel: WelcomeViewModelProtocol {
    
    // MARK: - Observables
    
    var routingEnum = Observable<Welcome.RoutingEnum?>(value: nil)
    var isLoading = Observable<Bool?>(value: nil)
    
    // MARK: - Properties
    
    var welcomeSignInUseCase: WelcomeSignInUseCaseProtocol
    
    // MARK: - LifeCycle
    
    init(welcomeSignInUseCase: WelcomeSignInUseCaseProtocol) {
        self.welcomeSignInUseCase = welcomeSignInUseCase
    }
    
    // MARK: - Methods
    
    func update(routingEnum: Welcome.RoutingEnum?) {
        self.routingEnum.value = routingEnum
    }
    
    func executeWelcomeSignInUseCase() {
        self.isLoading.value = true
        self.welcomeSignInUseCase.execute { successfulSignIn in
            self.isLoading.value = false
            if successfulSignIn {
                self.update(routingEnum: .dashboard)
            }
        }
    }
    
}
