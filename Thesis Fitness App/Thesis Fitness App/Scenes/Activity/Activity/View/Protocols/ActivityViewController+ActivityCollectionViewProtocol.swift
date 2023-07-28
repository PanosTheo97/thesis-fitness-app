//
//  ActivityViewController+ActivityCollectionViewProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 26/7/23.
//

import Foundation

extension ActivityViewController: ActivityCollectionViewProtocol {
    func activityTapped(activityId: String) {
        self.viewModel?.update(routing: .activityParameter(activityId: activityId))
    }
    
}
