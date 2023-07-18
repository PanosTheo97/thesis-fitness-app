//
//  StringExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import Foundation

extension String {
    
    func getLocalized() -> String {
        guard let bundle = appViewModel.localizationManagerProtocol.bundle else {
            return NSLocalizedString(self, comment: "")
        }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
