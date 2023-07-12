//
//  BaseFlowCoordinatorProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import SVProgressHUD

protocol BaseFlowCoordinatorProtocol {
    
    // MARK: - Methods
    
    func handleLoader(_ isLoading: Bool?)
}

extension BaseFlowCoordinatorProtocol {
    
    func handleLoader(_ isLoading: Bool?) {
        if isLoading ?? false {
            SVProgressHUD.show()
        } else {
            DispatchQueue.main.async {
                SVProgressHUD.dismiss(withDelay: 0.5)
            }
        }
    }
}
