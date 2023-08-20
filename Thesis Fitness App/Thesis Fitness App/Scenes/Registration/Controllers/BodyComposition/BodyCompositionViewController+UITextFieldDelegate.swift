//
//  BodyCompositionViewController+UITextFieldDelegate.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation
import UIKit

extension BodyCompositionViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.bodyweightTextField:
            self.muscleMassTextField.becomeFirstResponder()
        case self.muscleMassTextField:
            self.fatMassTextField.becomeFirstResponder()
        default:
            self.fatMassTextField.resignFirstResponder()
        }
    }
    
}
