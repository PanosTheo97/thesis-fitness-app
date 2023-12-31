//
//  UIImageExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation

import UIKit

enum Image: String {
    case AppLogo
    case Google
    case Home
    case Activity
    case Workout
    case Diet
    case Profile
    case Edit
    case Settings
    case History
}

extension UIImage {
    
    // MARK: - Methods
    
    static func get(image: Image) -> UIImage? {
        guard let image = UIImage(named: image.rawValue) else {
            print("COULD NOT FIND IMAGE '\(image.rawValue)'")
            return nil
        }
        return image
    }
}
