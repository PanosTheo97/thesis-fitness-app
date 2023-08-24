//
//  TabBarViewControllerProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 29/7/23.
//

import Foundation
import UIKit

protocol TabBarViewControllerProtocol: UIViewController {
    
    var lobbyTabBarController: LobbyTabBarController? { get set }
    
    func hideTabBar()
    func showTabBar()
}

extension TabBarViewControllerProtocol {
    
    func hideTabBar() {
        #warning("Hide animation bug - low priority")
        guard let tabBarController = self.navigationController?.parent as? LobbyTabBarController else {
            return
        }
        
        tabBarController.tabBar.isHidden = true
        
        var frame = tabBarController.tabBar.frame
        frame.origin.y = self.view.frame.size.height + frame.size.height
    
        UIView.animate(withDuration: 0.12, animations: {
            tabBarController.tabBar.frame = frame
        }, completion: { _ in
            //tabBarController.tabBar.isHidden = true
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
