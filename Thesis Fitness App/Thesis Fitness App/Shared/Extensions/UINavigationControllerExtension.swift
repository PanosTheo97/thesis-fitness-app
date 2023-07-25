//
//  UINavigationControllerExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func removeViewController(_ controller: UIViewController.Type) {
        self.viewControllers.removeAll(where: { (vc) -> Bool in
            return vc.isKind(of: controller.self)
        })
    }
}
