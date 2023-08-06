//
//  AttributedProperty.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 6/8/23.
//

import Foundation
import UIKit

class AttributedProperty {
    
    // MARK: - Properties
    
    var text: String
    var textColor: UIColor
    var font: UIFont
    var strokeProperty: StrokeProperty
    var link: String?
    var underlineStyle: NSUnderlineStyle?
    
    // MARK: - Life cycle
    
    init(text: String, textColor: UIColor, font: UIFont, strokeProperty: StrokeProperty = StrokeProperty(stroke: 0, strokeColor: .clear), link: String? = nil, underlineStyle: NSUnderlineStyle? = nil) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.strokeProperty = strokeProperty
        self.link = link
        self.underlineStyle = underlineStyle
    }
    
}

class StrokeProperty {
    
    // MARK: - Properties
    
    var stroke: Float
    var strokeColor: UIColor
    
    // MARK: - Life cycle
    
    init(stroke: Float = 0, strokeColor: UIColor = .clear) {
        self.stroke = stroke
        self.strokeColor = strokeColor
    }
    
}
