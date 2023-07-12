//
//  UIWindowExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import UIKit

extension UIWindow {
    
    // MARK: - TopMostViewController
    
    class var topMostViewController: UIViewController {
        return topMostViewController(from: UIApplication.shared.windows.first?.rootViewController ?? UIViewController())
    }
    
    class var topMostAppWindowViewController: UIViewController {
        
        let keyWindow = UIApplication.shared.windows.first { (window) -> Bool in
            return window.isKeyWindow
        }
        return topMostViewController(from: keyWindow?.rootViewController ?? UIViewController())
    }
    
    private class func topMostViewController(from controller: UIViewController) -> UIViewController {
        if let navigationVisibleViewController = (controller as? UINavigationController)?.visibleViewController {
            return topMostViewController(from: navigationVisibleViewController)
        }
        if let tabSelectedViewController = (controller as? UITabBarController)?.selectedViewController {
            return topMostViewController(from: tabSelectedViewController)
        }
        if let presentedViewController = controller.presentedViewController {
            return topMostViewController(from: presentedViewController)
        }
        return controller
    }
    
    // MARK: - RootViewController
    
    class func setRootViewController(viewController: UIViewController?) {
        guard let viewController = viewController else {
            return
        }
        self.dismissToRootViewController(newRootViewController: viewController)
    }
    
    private class func dismissToRootViewController(newRootViewController: UIViewController) {
        var viewControllers = [UIViewController]()
        guard let window = UIApplication.shared.delegate?.window else { return }
        guard var rootViewController = window?.rootViewController else { return }
        viewControllers.append(rootViewController)
        while let viewController = rootViewController.presentedViewController {
            rootViewController = viewController
            viewControllers.append(viewController)
        }
        dismissViewControllers(ArraySlice(viewControllers), newRootViewController: newRootViewController)
    }
    
    private class func dismissViewControllers(_ viewControllers: ArraySlice<UIViewController>, newRootViewController: UIViewController) {
        
        guard let viewController = viewControllers.last else { return }
        
        if viewControllers.count == 1 {
            
            guard let window = UIApplication.shared.delegate?.window as? UIWindow else {
                return
            }
            
            window.rootViewController = nil
            window.rootViewController = newRootViewController
            window.makeKeyAndVisible()
            
        } else {
            
            DispatchQueue.main.async {
                viewController.dismiss(animated: true) {
                    dismissViewControllers(viewControllers.dropLast(), newRootViewController: newRootViewController)
                }
            }
            
        }
    }
}
