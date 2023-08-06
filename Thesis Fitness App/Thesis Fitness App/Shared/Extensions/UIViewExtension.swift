//
//  UIViewExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: - initialize view inside class connected to xib
    
    //  @IBOutlet var view: UIView!
    //  view = self.getViewFromNib(named: "PasswordInformationView")
    
    func getViewFromNib(named name: String) -> UIView {
        guard let view = Bundle.main.loadNibNamed(name, owner: self, options: nil)?[0] as? UIView else { return UIView() }
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        self.addSubview(view)
        return view
    }
    
    // MARK: - initialize view class with xib programmatically
    
    // let view = CustomClassView.fromNib()
    
    class func fromNib(nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil: nibNameOrNil, type: self)
    }
    
    private class func fromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(nibNameOrNil: nibNameOrNil, type: T.self)
        return v!
    }
    
    private class func fromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            name = nibName
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    private class var nibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }
    
    func dropShadow(offset: CGSize = CGSize(width: 2, height: 2), radius: CGFloat = 3, color: UIColor = .black, opacity: Float = 0.5) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func addShadowAndCorners(offset: CGSize = CGSize(width: 2, height: 2), radius: CGFloat = 3, opacity: Float = 0.5) {
        self.layer.cornerRadius = 8
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.backgroundColor = self.backgroundColor?.cgColor
    }
    
    func addDashedBorder(color: CGColor) {
        
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        
        shapeLayer.lineWidth = 3
        shapeLayer.strokeColor = color
        shapeLayer.lineDashPattern = [3, 6] as [NSNumber]
        shapeLayer.frame = bounds
        shapeLayer.fillColor = nil
        shapeLayer.masksToBounds = true
        if layer.cornerRadius > 0 {
            shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        } else {
            shapeLayer.path = UIBezierPath(rect: bounds).cgPath
        }
        layer.addSublayer(shapeLayer)
    }
    
    func  addAndExpand(inside parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 0).isActive = true
        self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0).isActive = true
    }
    
    func addAndCenter(inside parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
    }
    
    func addAndExpandWithSafeArea(inside controller: UIViewController) {
        self.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(self)
        let margins = controller.view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        if #available(iOS 11, *) {
            let guide = controller.view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
                guide.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 1.0)
            ])
        } else {
            let standardSpacing: CGFloat = 8.0
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: controller.topLayoutGuide.bottomAnchor, constant: standardSpacing),
                controller.bottomLayoutGuide.topAnchor.constraint(equalTo: bottomAnchor, constant: standardSpacing)
            ])
        }
    }
}
