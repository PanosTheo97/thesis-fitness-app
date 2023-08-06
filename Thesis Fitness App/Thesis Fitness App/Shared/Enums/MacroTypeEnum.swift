//
//  MacroTypeEnum.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 6/8/23.
//

import Foundation
import UIKit

enum MacroTypeEnum {
    case protein
    case carbonhydrates
    case fats
    case water
    case calories
    
    func getColor() -> UIColor {
        switch self {
        case .calories:
            return UIColor.systemRed
        case .water:
            return UIColor.systemBlue
        case .carbonhydrates:
            return UIColor.systemBrown
        case .fats:
            return UIColor.systemYellow
        case .protein:
            return UIColor.systemPink
        }
    }
    
    func getText() -> String {
        switch self {
        case .protein:
            return "P"
        case .carbonhydrates:
            return "C"
        case .fats:
            return "F"
        case .water:
            return "W"
        case .calories:
            return "CAL"
        }
    }
}
