//
//  PopoverPresentableViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import Foundation
import UIKit

protocol PopoverPresentableViewController: UIViewController {
    var popoverConfiguration: PopoverConfiguration? { get set }
}
