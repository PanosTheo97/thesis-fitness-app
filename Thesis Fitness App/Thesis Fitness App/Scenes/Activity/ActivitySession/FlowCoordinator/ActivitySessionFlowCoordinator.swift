//
//  ActivitySessionFlowCoordinator.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 2/8/23.
//

import Foundation
import UIKit

class ActivitySessionFlowCoordinator: BaseFlowCoordinatorProtocol, PopoverPresentingFlowCoordinatorProtocol {
    
    // MARK: - Properties

    var activitySessionDIContainer: ActivitySessionDIContainer
    
    weak var activitySessionViewController: ActivitySessionViewController?
    
    // MARK: - Life cycle
    
    init(activitySessionDIContainer: ActivitySessionDIContainer, activitySessionViewController: ActivitySessionViewController?) {
        self.activitySessionDIContainer = activitySessionDIContainer
        self.activitySessionViewController = activitySessionViewController
    }
    
    // MARK: - Methods

    func dismiss() {
        self.activitySessionViewController?.dismiss(animated: true)
    }
    
    func displayPopover(text: String, sourceView: UIView, preferedSize: CGSize, injectedView: UIView) {
        // Configuration
        var popoverConfiguration = PopoverConfiguration(size: preferedSize)
        popoverConfiguration = PopoverConfiguration(popoverDesiredSize: preferedSize,
                                                    permittedArrowDirection: .down,
                                                    popoverLayoutMargins: popoverConfiguration.popoverLayoutMargins,
                                                    backgroundColor: popoverConfiguration.backgroundColor)
        // ViewController
        guard let viewController = activitySessionDIContainer.popoverModule.makePopoverViewController(popOverConfiguration: popoverConfiguration,
                                                                                                 popOverSetupUseCaseEnum: .label(text)) else {
            return
        }
        // Get presentation controller
        guard let popoverPrsenetationViewController = activitySessionViewController else { return }
        // Display popover
        displayPopover(sourceView: sourceView, with: viewController, from: popoverPrsenetationViewController, completion: nil)
    }
    
}
