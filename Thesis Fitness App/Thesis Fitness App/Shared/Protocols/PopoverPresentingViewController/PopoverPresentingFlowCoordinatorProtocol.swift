//
//  PopoverPresentingFlowCoordinatorProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import Foundation
import UIKit

protocol PopoverPresentingFlowCoordinatorProtocol {
    func displayPopover(sourceView: UIView, with viewController: PopoverPresentableViewController?, from presentingViewController: PopoverPresentingViewControllerProtocol, completion: (() -> Void)?)
}

extension PopoverPresentingFlowCoordinatorProtocol {
    func displayPopover(sourceView: UIView, with viewController: PopoverPresentableViewController?, from presentingViewController: PopoverPresentingViewControllerProtocol, completion: (() -> Void)?) {
        
        guard let viewController = viewController, let popoverConfiguration = viewController.popoverConfiguration else {
            print("COULD NOT INITIALIZE popoverViewController")
            return
        }
        
        viewController.modalPresentationStyle = .popover
        viewController.popoverPresentationController?.delegate = presentingViewController
        viewController.popoverPresentationController?.sourceView = sourceView
        viewController.popoverPresentationController?.sourceRect = sourceView.bounds
        viewController.preferredContentSize = popoverConfiguration.popoverDesiredSize
        viewController.popoverPresentationController?.permittedArrowDirections = popoverConfiguration.permittedArrowDirection
        
        viewController.popoverPresentationController?.popoverLayoutMargins = popoverConfiguration.popoverLayoutMargins
        viewController.popoverPresentationController?.backgroundColor = popoverConfiguration.backgroundColor
        
        presentingViewController.present(popOverViewController: viewController, completion: completion)
    }
}
