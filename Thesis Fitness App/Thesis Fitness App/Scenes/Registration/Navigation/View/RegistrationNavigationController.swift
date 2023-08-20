//
//  RegistrationNavigationController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation
import UIKit

class RegistrationNavigationController: UINavigationController {

    // MARK: - Properties
    
    var flowCoordinator: RegistrationFlowCoordinator?
    var viewModel: RegistrationViewModel?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.configure()
    }
    
    // MARK: - Methods
    
    private func configure() {
        self.delegate = self
        
        self.interactivePopGestureRecognizer?.isEnabled = false
       
        self.navigationBar.isTranslucent = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        
        let button = UIBarButtonItemAppearance(style: .plain)
        appearance.buttonAppearance = button
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func setInitialViewController(_ viewController: UIViewController) {
        viewControllers = [viewController]
    }

}

extension RegistrationNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationController?.navigationBar.backItem?.title = ""
    }
}
