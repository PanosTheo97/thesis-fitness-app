//
//  ReusableViewProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import UIKit

protocol ReusableViewProtocol {
    static var reuseIdentifier: String { get }
}

extension ReusableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)+"Identifier"
    }
}

extension UIView: ReusableViewProtocol { }
