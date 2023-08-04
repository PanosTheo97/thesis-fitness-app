//
//  PopoverViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import Foundation
import CoreGraphics
import UIKit

protocol PopoverViewModelProtocol {
    
    // MARK: - Properties
    
    var popoverSetupUseCase: PopoverSetupUseCaseProtocol { get set }
    
    // MARK: - Observables
    
    var routingEnum: Observable<PopoverViewController.RoutingEnum?> { get set }
    
    var injectedView: Observable<UIView?> { get set }
    
    // MARK: - Methods
    
    func executeSetupUseCase(size: CGSize)
    
}

final class PopoverViewModel: PopoverViewModelProtocol {
    
    // MARK: - Properties
    
    var popoverSetupUseCase: PopoverSetupUseCaseProtocol
    
    // MARK: - Observables
    
    var routingEnum = Observable<PopoverViewController.RoutingEnum?>(value: nil)
    
    var injectedView = Observable<UIView?>(value: nil)
    
    // MARK: - Life cycle
    
    required init(popoverSetupUseCase: PopoverSetupUseCaseProtocol) {
        self.popoverSetupUseCase = popoverSetupUseCase
    }
    
    // MARK: - Methods
    
    func executeSetupUseCase(size: CGSize) {
        self.popoverSetupUseCase.execute(completion: { view in
            self.injectedView.value = view
        }, size: size)
    }
}
