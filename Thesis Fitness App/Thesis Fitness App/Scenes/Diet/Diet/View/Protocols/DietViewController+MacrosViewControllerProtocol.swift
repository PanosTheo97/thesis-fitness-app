//
//  DietViewController+MacrosViewControllerProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/8/23.
//

import Foundation

extension DietViewController: MacrosViewControllerProtocol {
    func addMacros(data: [DietModel]) {
        self.presentedViewController?.dismiss(animated: true)
        self.viewModel?.dietData.value = data
    }
}
