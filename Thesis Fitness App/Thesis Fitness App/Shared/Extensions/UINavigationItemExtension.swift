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
    
    func addTitle(title: String) {
        let label = UILabel()
        label.textColor = .App.mainText
        label.text = title
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    func addButtons(barButtonPositionEnum: NavigationButtonPositionEnum, navigationButtons: [NavigationButton]) {
        
        var barButtonItems: [UIBarButtonItem] = []
        
        navigationButtons.forEach { (navigationButton) in
            
            let customView = UIView()

            switch navigationButton.navigationButtonTypeEnum {
            case .title(let title):
                let label = UILabel()
                label.textColor = .App.mainText
                label.text = title
            case .back:
                let button = self.makeCustomButton(image: .init(systemName: "chevron.backward"),
                                                   highlightedImage: .init(systemName: "chevron.backward"),
                                                   rect: CGRect(x: 0, y: 0, width: 25, height: 25),
                                                   navigationButton: navigationButton)
                button.backgroundColor = .clear
                
                customView.frame = button.frame
                customView.addSubview(button)
            case .close:
                let button = self.makeCustomButton(image: .init(systemName: "xmark")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal),
                                                   highlightedImage: .init(systemName: "xmark"),
                                                   rect: CGRect(x: 0, y: 0, width: 25, height: 25),
                                                   navigationButton: navigationButton)
                button.backgroundColor = .clear
                
                customView.frame = button.frame
                customView.addSubview(button)
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
                                                   highlightedImage: .init(systemName: "gearshape"),
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
            case .checkmark:
                let button = self.makeCustomButton(image: .init(systemName: "checkmark")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal),
                                                   highlightedImage: .init(systemName: "checkmark")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal),
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
