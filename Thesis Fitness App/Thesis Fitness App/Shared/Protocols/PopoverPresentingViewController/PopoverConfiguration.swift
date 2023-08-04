//
//  PopoverConfiguration.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import Foundation

import UIKit

class PopoverConfiguration {
    var popoverDesiredSize: CGSize
    
    var permittedArrowDirection: UIPopoverArrowDirection = .down
    
    var popoverLayoutMargins: UIEdgeInsets = .zero
    
    var backgroundColor: UIColor = .systemGray2
    
    init(size: CGSize) {
        self.popoverDesiredSize = size
    }
    
    init(popoverDesiredSize: CGSize, permittedArrowDirection: UIPopoverArrowDirection, popoverLayoutMargins: UIEdgeInsets, backgroundColor: UIColor) {
        self.popoverDesiredSize = popoverDesiredSize
        self.permittedArrowDirection = permittedArrowDirection
        self.popoverLayoutMargins = popoverLayoutMargins
        self.backgroundColor = backgroundColor
    }
}
