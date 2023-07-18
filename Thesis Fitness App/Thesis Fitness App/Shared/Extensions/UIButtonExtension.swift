//
//  UIButtonExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import Foundation
import UIKit

extension UIButton {
    
    enum ButtonStyleEnum {
        case underlined(text: String, textColor: UIColor, font: UIFont)
        case rounded(backgroundcolor: UIColor, textColor: UIColor, text: String, font: UIFont)
        case roundedWithBorder(backgroundcolor: UIColor, borderColor: UIColor, borderWidth: CGFloat, textColor: UIColor, text: String, font: UIFont)
        case simple(text: String, textColor: UIColor, font: UIFont)
        case strikeThrough(text: String, textColor: UIColor, font: UIFont)
    }
    
    func applyStyle(buttonStyleEnum: ButtonStyleEnum) {
        switch buttonStyleEnum {
        case .underlined(let text, let textColor, let font):
            self.attributedWith(font: font, textColor: textColor, text: text, underlined: true)
        case .rounded(let backgroundcolor, let textColor, let text, let font):
            self.attributedWith(font: font, textColor: textColor, text: text, underlined: false)
            self.backgroundColor = backgroundcolor
            self.layer.cornerRadius = 4
            self.dropShadow()
        case .roundedWithBorder(let backgroundcolor, let borderColor, let borderWidth, let textColor, let text, let font):
            self.attributedWith(font: font, textColor: textColor, text: text, underlined: false)
            self.backgroundColor = backgroundcolor
            self.layer.cornerRadius = 4
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth
        case .simple(let text, let textColor, let font):
            self.attributedWith(font: font, textColor: textColor, text: text, underlined: false)
        case .strikeThrough(text: let text, textColor: let textColor, font: let font):
            self.attributedWith(font: font, textColor: textColor, text: text, strikeThrough: true)
        }
    }
    
    func attributedWith(font: UIFont, textColor: UIColor, text: String, underlined: Bool = false, state: UIControl.State = .normal) {
        self.setTitle("", for: state)
        var topStringAttributes = [NSAttributedString.Key.font: font,
                                   NSAttributedString.Key.foregroundColor: textColor,
                                   NSAttributedString.Key.baselineOffset: 2] as [NSAttributedString.Key: Any]
        if underlined {
            topStringAttributes[NSAttributedString.Key.underlineStyle] = NSUnderlineStyle.single.rawValue as NSObject
        }
        let topAttributedString = NSAttributedString(string: text, attributes: topStringAttributes)
        self.setAttributedTitle(topAttributedString, for: state)
    }
    
    func attributedWith(font: UIFont, textColor: UIColor, text: String, strikeThrough: Bool = false, state: UIControl.State = .normal) {
        self.setTitle("", for: state)
        let topStringAttributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]
        let topAttributedString = NSMutableAttributedString(string: text, attributes: topStringAttributes)
        if strikeThrough {
            topAttributedString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                             value: 2,
                                             range: NSRange(location: 0, length: topAttributedString.length))
        }
        
        self.setAttributedTitle(topAttributedString, for: state)
    }
    
    func addSpringAnimation() {
        addTarget(self, action: #selector(animateDown), for: [.touchUpInside, .touchDown, .touchDragEnter,])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 2,
                       options: [.curveEaseInOut],
                       animations: {
            button.transform = transform
        }, completion: nil)
    }
    
}
