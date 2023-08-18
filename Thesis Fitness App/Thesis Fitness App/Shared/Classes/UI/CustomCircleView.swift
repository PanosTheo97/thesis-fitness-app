//
//  CustomCircleView.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 6/8/23.
//

import Foundation
import UIKit

enum CircleViewTypeEnum {
    case full
    case half
}

class CustomCircleView: UIView {
    
    // MARK: - Properties
    
    private var maxQuantity: Int = 0
    private var consumedQuantity: Int = 0
    private var macroTypeEnum: MacroTypeEnum = .protein
    
    private var circleLayer = CAShapeLayer()
    private var startingLayer = CAShapeLayer()
    private var startPoint = CGFloat(Double.pi / 2)
    private var endPoint = CGFloat(5 * Double.pi / 2)
    private var radius = CGFloat(40)
    private var lineWidth = CGFloat(10)
    
    private let sharesLabel = UILabel()
    private var sharesOverlayView = UIView()
    
    private var circleViewTypeEnum: CircleViewTypeEnum = .half
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Methods
    
    func configure(circleViewTypeEnum: CircleViewTypeEnum, macroTypeEnum: MacroTypeEnum, maxQuantity: Int, consumedQuantity: Int, radius: CGFloat = 60, lineWidth: CGFloat = 14) {
        layer.sublayers = nil // remove all layers on reuse
        self.backgroundColor = .clear
        
        self.maxQuantity = maxQuantity
        self.consumedQuantity = consumedQuantity
        self.radius = radius - (lineWidth / 2)
        self.lineWidth = lineWidth
        
        self.macroTypeEnum = macroTypeEnum
        self.circleViewTypeEnum = circleViewTypeEnum
        
        // Circluar path start and end point based on sharesCircleViewEnum
        switch self.circleViewTypeEnum {
        case .full:
            self.startPoint = CGFloat(Double.pi / 2)
            self.endPoint = CGFloat(5 * Double.pi / 2)
        case .half:
            self.startPoint = CGFloat(5 * Double.pi / 6)
            self.endPoint = CGFloat(Double.pi / 6)
        }
        
        // Create circle Path
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: self.radius, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        
        // Circle Layer configuration
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = self.lineWidth
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.lightGray.cgColor
        layer.addSublayer(circleLayer)
        
        // Progress Layer configuration
//        progressLayer.path = circularPath.cgPath
//        progressLayer.fillColor = UIColor.clear.cgColor
//        progressLayer.lineCap = .round
//        progressLayer.lineWidth = self.lineWidth
//        progressLayer.strokeStart = Double(self.consumedQuantity) / Double(self.maxQuantity)
//        progressLayer.strokeEnd = 0
//        progressLayer.strokeColor = UIColor.green.cgColor
//        layer.addSublayer(progressLayer)
        
        // Starting Layer configuration
        startingLayer.path = circularPath.cgPath
        startingLayer.fillColor = UIColor.clear.cgColor
        startingLayer.lineCap = .round
        startingLayer.lineWidth = self.lineWidth
        startingLayer.strokeStart = 0
        startingLayer.strokeEnd = 0
        startingLayer.strokeColor = self.macroTypeEnum.getColor().cgColor
        layer.addSublayer(startingLayer)
        self.progressAnimation(duration: 1.2, fromValue: 0, toValue: Double(self.consumedQuantity) / Double(self.maxQuantity))
        
        self.addSharesLabel()
    }
    
    func addSharesOverlayView() {
        // Shares overlay view configuration
        
        switch self.circleViewTypeEnum {
        case .full:
            let sharesOverlayViewY = (frame.size.height / 2.0) + radius - circleLayer.lineWidth
            let sharesOverlayViewX = (frame.size.width / 2.0) - ((circleLayer.lineWidth * 3) / 2)
            sharesOverlayView = UIView(frame: CGRect(origin: CGPoint(x: sharesOverlayViewX, y: sharesOverlayViewY), size: CGSize(width: circleLayer.lineWidth * 2, height: circleLayer.lineWidth)))
            
            sharesOverlayView.layer.borderColor = UIColor.white.cgColor
            sharesOverlayView.layer.borderWidth = 2
            self.addSubview(sharesOverlayView)
        case .half:
            sharesOverlayView.translatesAutoresizingMaskIntoConstraints = false
            sharesOverlayView.frame.size = CGSize(width: circleLayer.lineWidth * 2, height: circleLayer.lineWidth)
            self.addSubview(sharesOverlayView)
            sharesOverlayView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.lineWidth + 12).isActive = true
            sharesOverlayView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            sharesOverlayView.widthAnchor.constraint(equalToConstant: circleLayer.lineWidth * 3).isActive = true
            sharesOverlayView.heightAnchor.constraint(equalToConstant: circleLayer.lineWidth * 2).isActive = true
            
            sharesOverlayView.layer.borderColor = self.macroTypeEnum.getColor().withAlphaComponent(0.3).cgColor
            sharesOverlayView.layer.borderWidth = 2
            
        }
        sharesOverlayView.backgroundColor =  self.macroTypeEnum.getColor()
        sharesOverlayView.layer.cornerRadius = sharesOverlayView.frame.height / 2
        
        let sharesOverlayLabel = EdgeInsetLabel()
        sharesOverlayLabel.addAndCenter(inside: sharesOverlayView)
        sharesOverlayLabel.adjustsFontSizeToFitWidth = true
        sharesOverlayLabel.minimumScaleFactor = 0.5
        sharesOverlayLabel.textColor = .label
        sharesOverlayLabel.bottomTextInset = 2
        sharesOverlayLabel.font =  .systemFont(ofSize: 12, weight: .bold)
        sharesOverlayLabel.text = self.macroTypeEnum.getText()
        
    }
    
    func addSharesLabel() {
        sharesLabel.addAndCenter(inside: self)
        sharesLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.75).isActive = true
        sharesLabel.adjustsFontSizeToFitWidth = true
        sharesLabel.minimumScaleFactor = 0.5
        sharesLabel.numberOfLines = 0
        sharesLabel.textAlignment = .center
        sharesLabel.withAttributedText(attributedProperties: [.init(text: "\(self.consumedQuantity)/\(self.maxQuantity)",
                                                                    textColor: .label,
                                                                    font: .systemFont(ofSize: 10, weight: .bold))])
    }
    
    // MARK: - Starting Layer Animation

    func progressAnimation(duration: TimeInterval, fromValue: Double, toValue: Double) {
        let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")

        progressAnimation.duration = duration
        progressAnimation.fromValue = fromValue
        progressAnimation.toValue = toValue
        progressAnimation.fillMode = .forwards
        progressAnimation.isRemovedOnCompletion = false
        startingLayer.add(progressAnimation, forKey: nil)
    }
    
}
