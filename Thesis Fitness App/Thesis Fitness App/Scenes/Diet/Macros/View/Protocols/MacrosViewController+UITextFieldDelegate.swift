//
//  MacrosViewController+UITextFieldDelegate.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/8/23.
//

import Foundation
import UIKit

extension MacrosViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (self.caloriesTextField.text ?? "").isEmpty && (self.proteinTextField.text ?? "").isEmpty && (self.carbsTextField.text ?? "").isEmpty && (self.fatsTextField.text ?? "").isEmpty && (self.waterTextField.text ?? "").isEmpty {
            self.updateSaveButton(isEnabled: false)
        } else {
            self.updateSaveButton(isEnabled: true)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (self.caloriesTextField.text ?? "").isEmpty && (self.proteinTextField.text ?? "").isEmpty && (self.carbsTextField.text ?? "").isEmpty && (self.fatsTextField.text ?? "").isEmpty && (self.waterTextField.text ?? "").isEmpty {
            self.updateSaveButton(isEnabled: false)
        } else {
            self.updateSaveButton(isEnabled: true)
        }
    }
    
    func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.caloriesTextField:
            self.proteinTextField.becomeFirstResponder()
        case self.proteinTextField:
            self.carbsTextField.becomeFirstResponder()
        case self.carbsTextField:
            self.fatsTextField.becomeFirstResponder()
        case self.fatsTextField:
            self.waterTextField.becomeFirstResponder()
        default:
            self.waterTextField.resignFirstResponder()
        }
    }
    
}
