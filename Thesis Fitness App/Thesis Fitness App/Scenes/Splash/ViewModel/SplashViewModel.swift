//
//  SplashViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation

class SplashViewModel: BaseViewModelProtocol {

    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<Splash.RoutingEnum?>(value: nil)
    
    // MARK: - Properties
    
    var splashCheckForUserUseCase: SplashCheckForUserUseCaseProtocol
    
    // MARK: - Life cycle
    
    init(splashCheckForUserUseCase: SplashCheckForUserUseCaseProtocol) {
        self.splashCheckForUserUseCase = splashCheckForUserUseCase
    }
    
    func update(routing: Splash.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
    func executeSplashCheckForUserUseCase() {
        self.splashCheckForUserUseCase.execute { isSignedInUser in
            if isSignedInUser {
                self.update(routing: .lobby)
            } else {
                self.update(routing: .welcome)
            }
        }
    }
}
