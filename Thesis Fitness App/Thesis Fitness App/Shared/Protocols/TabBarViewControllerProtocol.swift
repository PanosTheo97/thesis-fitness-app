//
//  TabBarViewControllerProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 29/7/23.
//

import Foundation
import UIKit

protocol TabBarViewControllerProtocol: UIViewController {
    
    func hideTabBar()
    func showTabBar()
}

extension TabBarViewControllerProtocol {
    
    func hideTabBar() {
        guard let tabBarController = self.navigationController?.parent as? LobbyTabBarController else {
            return
        }
        
        var frame = tabBarController.tabBar.frame
        frame.origin.y = self.view.frame.size.height + frame.size.height
    
        UIView.animate(withDuration: 0.12, animations: {
            tabBarController.tabBar.frame = frame
        }, completion: { _ in
            tabBarController.tabBar.isHidden = true
        })
    }
    
    func showTabBar() {
        guard let tabBarController = self.navigationController?.parent as? LobbyTabBarController else {
            return
        }
        
        tabBarController.tabBar.isHidden = false
        
        var frame = tabBarController.tabBar.frame
        frame.origin.y = self.view.frame.size.height - frame.size.height
        UIView.animate(withDuration: 0.12, animations: {
            tabBarController.tabBar.frame = frame
        })
    }
    
}
