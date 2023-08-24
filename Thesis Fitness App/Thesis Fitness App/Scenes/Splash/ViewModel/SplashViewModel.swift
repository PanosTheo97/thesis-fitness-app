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
    var checkForRegistereduserUseCase: CheckForRegistereduserUseCaseProtocol
    
    // MARK: - Life cycle
    
    init(splashCheckForUserUseCase: SplashCheckForUserUseCaseProtocol, checkForRegistereduserUseCase: CheckForRegistereduserUseCaseProtocol) {
        self.splashCheckForUserUseCase = splashCheckForUserUseCase
        self.checkForRegistereduserUseCase = checkForRegistereduserUseCase
    }
    
    func update(routing: Splash.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
    func executeSplashCheckForUserUseCase() {
        self.splashCheckForUserUseCase.execute { isSignedInUser in
            if isSignedInUser {
                self.executeWelcomeCheckForRegistereduserUseCase()
            } else {
                self.update(routing: .welcome)
            }
        }
    }
    
    func executeWelcomeCheckForRegistereduserUseCase() {
        self.checkForRegistereduserUseCase.execute { isAlreadyRegistered in
            switch isAlreadyRegistered {
            case true:
                self.update(routing: .lobby)
            default:
                print("ERROR")
            }
        }
    }
}
