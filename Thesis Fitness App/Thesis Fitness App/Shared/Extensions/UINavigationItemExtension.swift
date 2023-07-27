//
//  UINavigationItemExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation
import UIKit

typealias NavigationButton = (navigationButtonTypeEnum: NavigationButtonTypeEnum, action: Selector, target: UIViewController)

extension UINavigationItem {
    
    func addButtons(barButtonPositionEnum: NavigationButtonPositionEnum, navigationButtons: [NavigationButton]) {
        
        var barButtonItems: [UIBarButtonItem] = []
        
        navigationButtons.forEach { (navigationButton) in
            
            let customView = UIView()

            switch navigationButton.navigationButtonTypeEnum {
            case .edit:
                let button = self.makeCustomButton(image: .get(image: .Edit),
                                                   highlightedImage: .get(image: .Edit),
                                                   rect: CGRect(x: 0, y: 0, width: 25, height: 25),
                                                   navigationButton: navigationButton)
                button.backgroundColor = .clear
                
                customView.frame = button.frame
                customView.addSubview(button)
            case .settings:
                let button = self.makeCustomButton(image: .init(systemName: "gearshape"),
                                                   highlightedImage: .get(image: .Settings),
                                                   rect: CGRect(x: 0, y: 0, width: 25, height: 25),
                                                   navigationButton: navigationButton)
                button.backgroundColor = .clear
                
                customView.frame = button.frame
                customView.addSubview(button)
            case .history:
                let button = self.makeCustomButton(image: .get(image: .History),
                                                   highlightedImage: .get(image: .History),
                                                   rect: CGRect(x: 0, y: 0, width: 25, height: 25),
                                                   navigationButton: navigationButton)
                button.backgroundColor = .clear
                
                customView.frame = button.frame
                customView.addSubview(button)
            default: ()
            }
            let barButton = UIBarButtonItem(customView: customView)
            barButtonItems.append(barButton)
        }
        
        if barButtonPositionEnum == .left {
            self.leftBarButtonItems = barButtonItems
        } else {
            self.rightBarButtonItems = barButtonItems
        }
    }
    
    private func makeCustomButton(title: String? = nil, textColor: UIColor = .white, image: UIImage? = nil, highlightedImage: UIImage? = nil, rect: CGRect? = nil, navigationButton: NavigationButton) -> UIButton {
        let customButton = UIButton(type: .system)
        if let rect = rect {
            customButton.frame = rect
        }
        customButton.attributedWith(font: UIFont.systemFont(ofSize: 12),
                                    textColor: textColor, text: title ?? "",
                                    underlined: false,
                                    state: .normal)
        customButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        customButton.contentMode = .scaleAspectFit
        customButton.setImage(image, for: .normal)
        customButton.setImage(highlightedImage, for: .highlighted)
        customButton.addTarget(navigationButton.target, action: navigationButton.action, for: .touchUpInside)
        customButton.sizeToFit()
        return customButton
    }
    
}
