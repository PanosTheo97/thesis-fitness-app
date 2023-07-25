//
//  AppViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import SVProgressHUD

class AppViewModel {
    
    let localizationManagerProtocol: LocalizationManagerProtocol
    let defaultsManagerProtocol: DefaultsManagerProtocol
    
    init(localizationManagerProtocol: LocalizationManagerProtocol = LocalizationManager(), defaultsManagerProtocol: DefaultsManagerProtocol = DefaultsManager()) {
        self.localizationManagerProtocol = localizationManagerProtocol
        self.defaultsManagerProtocol = defaultsManagerProtocol
    }

    // MARK: - Methods

    func configureLoader(thickness: CGFloat = 5, color: UIColor = UIColor.darkGray, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) {
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setBackgroundColor(.clear)
        SVProgressHUD.setOffsetFromCenter(offset)
        SVProgressHUD.setRingThickness(thickness)
        SVProgressHUD.setForegroundColor(color)
    }
    
}
