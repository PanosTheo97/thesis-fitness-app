//
//  RegistrationViewControllerProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation
import UIKit

protocol RegistrationViewControllerProtocol: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: RegistrationViewModel? { get set }
    var registrationNavigation: RegistrationNavigationController? { get set }
    
}
