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
    func executeWelcomeCheckForRegistereduserUseCase()
    
}

class WelcomeViewModel: WelcomeViewModelProtocol {
    
    // MARK: - Observables
    
    var routingEnum = Observable<Welcome.RoutingEnum?>(value: nil)
    var isLoading = Observable<Bool?>(value: nil)
    
    // MARK: - Properties
    
    var welcomeSignInUseCase: WelcomeSignInUseCaseProtocol
    var checkForRegistereduserUseCase: CheckForRegistereduserUseCaseProtocol
    
    // MARK: - LifeCycle
    
    init(welcomeSignInUseCase: WelcomeSignInUseCaseProtocol, checkForRegistereduserUseCase: CheckForRegistereduserUseCaseProtocol) {
        self.welcomeSignInUseCase = welcomeSignInUseCase
        self.checkForRegistereduserUseCase = checkForRegistereduserUseCase
    }
    
    // MARK: - Methods
    
    func update(routingEnum: Welcome.RoutingEnum?) {
        self.routingEnum.value = routingEnum
    }
    
    func executeWelcomeSignInUseCase() {
        self.isLoading.value = true
        self.welcomeSignInUseCase.execute { successfulSignIn in
            if successfulSignIn {
                self.executeWelcomeCheckForRegistereduserUseCase()
            } else {
                self.isLoading.value = false
            }
        }
    }
    
    func executeWelcomeCheckForRegistereduserUseCase() {
        self.checkForRegistereduserUseCase.execute { isAlreadyRegistered in
            self.isLoading.value = false
            switch isAlreadyRegistered {
            case true:
                self.update(routingEnum: .lobby)
            case false:
                self.update(routingEnum: .firstTimeSignIn)
            default:
                print("NETWORK ERROR")
            }
        }
    }
    
}
