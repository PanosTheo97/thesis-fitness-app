//
//  CustomAlert.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 5/8/23.
//

import Foundation
import UIKit

class CustomAlert {
    static func createAlert(message: String, action: [UIAlertAction]) -> UIAlertController {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.setValue(NSAttributedString(string: message,
                                          attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                                       NSAttributedString.Key.foregroundColor: UIColor.label]), forKey: "attributedTitle")
        for i in 0..<action.count {
            if action[i].style == .destructive {
                action[i].setValue(UIColor.systemRed, forKey: "TitleTextColor")
            } else {
                action[i].setValue(UIColor.label, forKey: "TitleTextColor")
            }
            alert.addAction(action[i])
        }
        
        guard let subview = alert.view.subviews.first?.subviews.first?.subviews.first as? UIView else {
            return alert
        }
        subview.backgroundColor = .lightGray
        
        return alert
    }
}
