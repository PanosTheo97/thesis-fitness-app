//
//  UIColorExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import UIKit

extension UIColor {
    
    // MARK: - Life cycle
    
    convenience init(hexString: String) {
        let hexString   = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) as NSString
        let scanner     = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
        }
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        var a = UInt64(color >> 24) & 0x000000ff
        
        if hexString.length == 7 {
            a = 255
        }
        
        let r = UInt64(color >> 16) & 0x000000ff
        let g = UInt64(color >> 8) & 0x000000ff
        let b = UInt64(color) & 0x000000ff
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        let alpha = CGFloat(a) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // MARK: - Application Generic Colors
    
    struct App {
        static var lightGray: UIColor {
            UIColor(hexString: "#FDFDFD")
        }
        
        static var bluredWhite: UIColor {
            UIColor(hexString: "#DEDEDF")
        }
        
        static var mainRed: UIColor {
            UIColor(hexString: "#F3090A")
        }
        
        static var brightRed: UIColor {
            UIColor(hexString: "#F30B0A")
        }
        
        static var darkGray: UIColor {
            UIColor(hexString: "#22252B")
        }
        
        static var gray: UIColor {
            UIColor(hexString: "#363B45")
        }
        
    }
    
}
