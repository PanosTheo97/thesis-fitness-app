//
//  PopoverPresentingViewControllerProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import Foundation
import UIKit

protocol PopoverPresentingViewControllerProtocol: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle
    func present(popOverViewController: UIViewController, completion: (() -> Void)?)
}

extension PopoverPresentingViewControllerProtocol where Self: UIViewController {
    
    // MARK: - IMPORTANT -
    // COPY THIS IN VIEW CONTROLLER IN ORDER TO WORK
    // SEE https://stackoverflow.com/a/58389857
    /// Non-'@objc' method 'adaptivePresentationStyle(for:traitCollection:)' does not satisfy optional requirement of '@objc' protocol 'UIAdaptivePresentationControllerDelegate'
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    func present(popOverViewController: UIViewController, completion: (() -> Void)?) {
        self.present(popOverViewController, animated: true, completion: completion)
    }
}
