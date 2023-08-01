//
//  ActivityParameterViewController+UITextFieldDelegate.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 1/8/23.
//

import Foundation
import UIKit

extension ActivityParameterViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == nil || textField.text == "" {
            self.startButton.isEnabled = false
        } else {
            self.startButton.isEnabled = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == nil || textField.text == "" {
            self.startButton.isEnabled = false
        } else {
            self.startButton.isEnabled = true
        }
    }
}
