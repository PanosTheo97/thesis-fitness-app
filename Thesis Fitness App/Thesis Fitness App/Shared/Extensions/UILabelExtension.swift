//
//  UILabelExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 6/8/23.
//

import Foundation
import UIKit

extension UILabel {
    func withAttributedText(attributedProperties: [AttributedProperty],
                            alignment: NSTextAlignment = .center,
                            lineHeightMultiple: CGFloat = 0,
                            lineSpacing: CGFloat = 0,
                            letterSpacing: CGFloat = 0,
                            underlineStyle: NSUnderlineStyle? = nil) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = alignment
        paragraphStyle.lineBreakMode = .byWordWrapping
        let combinedAttributedText = NSMutableAttributedString()
        for attributedProperty in attributedProperties {
            let titleAttributedString = NSMutableAttributedString(string: attributedProperty.text)
            titleAttributedString.addAttributes([NSAttributedString.Key.font: attributedProperty.font,
                                                 NSAttributedString.Key.kern: letterSpacing,
                                                 NSAttributedString.Key.foregroundColor: attributedProperty.textColor,
                                                 NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                 NSAttributedString.Key.strokeWidth: attributedProperty.strokeProperty.stroke,
                                                 NSAttributedString.Key.strokeColor: attributedProperty.strokeProperty.strokeColor],
                                                range: NSRange(location: 0, length: titleAttributedString.length))
            
            if let underlineStyle = attributedProperty.underlineStyle {
                titleAttributedString.addAttributes([NSAttributedString.Key.underlineStyle: underlineStyle.rawValue],
                                                    range: NSRange(location: 0, length: titleAttributedString.length))
            }
            
            combinedAttributedText.append(titleAttributedString)
        }
        
        if let underlineStyle = underlineStyle {
            combinedAttributedText.addAttributes([NSAttributedString.Key.underlineStyle: underlineStyle.rawValue], range: NSRange(location: 0, length: combinedAttributedText.length))
        }

        self.attributedText = combinedAttributedText

    }
}
