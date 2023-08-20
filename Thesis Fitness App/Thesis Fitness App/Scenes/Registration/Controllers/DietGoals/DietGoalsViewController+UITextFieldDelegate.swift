//
//  DietGoalsViewController+UITextFieldDelegate.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation
import UIKit

extension DietGoalsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
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
