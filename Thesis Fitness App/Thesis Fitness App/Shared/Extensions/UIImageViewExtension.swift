//
//  UIImageViewExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func cancelFetch() {
        self.kf.cancelDownloadTask()
    }
    
    func displayImage(url: URL?, placeholder: UIImage?, extraOptions: KingfisherOptionsInfo? = nil) {
        var options: KingfisherOptionsInfo = [.transition(.fade(0.5))]
        if let extraOptions = extraOptions {
            options += extraOptions
        }
        self.kf.setImage(with: url, placeholder: placeholder, options: extraOptions)
    }
}
