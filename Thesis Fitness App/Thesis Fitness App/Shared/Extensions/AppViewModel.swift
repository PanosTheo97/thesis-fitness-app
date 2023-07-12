//
//  AppViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import SVProgressHUD

class AppViewModel {


    // MARK: - Methods

    func configureLoader(thickness: CGFloat = 5, color: UIColor = UIColor.App.lightGray, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) {
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setBackgroundColor(UIColor.clear)
        SVProgressHUD.setOffsetFromCenter(offset)
        SVProgressHUD.setRingThickness(thickness)
        SVProgressHUD.setForegroundColor(color)
    }
    
}
