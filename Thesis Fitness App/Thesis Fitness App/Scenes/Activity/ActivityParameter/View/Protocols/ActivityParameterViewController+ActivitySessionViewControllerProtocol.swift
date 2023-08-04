//
//  ActivityParameterViewController+ActivitySessionViewControllerProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import Foundation

extension ActivityParameterViewController: ActivitySessionViewControllerProtocol {
    func dismissToActivity() {
        self.flowCoordinator?.pop()
    }
}
