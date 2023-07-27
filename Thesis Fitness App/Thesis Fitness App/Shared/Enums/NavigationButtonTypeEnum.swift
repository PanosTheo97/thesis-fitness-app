//
//  NavigationButtonEnum.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

enum NavigationButtonTypeEnum {
    case edit
    case next
    case history
    case settings
    case back
    case close
    case scan
    case title(title: String)
    case checkmark
}

enum NavigationButtonPositionEnum {
    case right
    case left
}
