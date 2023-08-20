//
//  NameViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import UIKit

class NameViewController: UIViewController, RegistrationViewControllerProtocol {
    
    // MARK: - IBProperties
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .App.mainText
            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            titleLabel.text = "Registration_Name_titleLabel".getLocalized()
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.borderStyle = .none
            nameTextField.tintColor = .label
            nameTextField.textColor = .label
            nameTextField.keyboardType = .namePhonePad
            //nameTextField.delegate = self
            nameTextField.backgroundColor = .App.mainText
            nameTextField.layer.cornerRadius = 4
            nameTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            nameTextField.setLeftPaddingPoints(10)
        }
    }
    
    // MARK: - Properties
    
    var viewModel: RegistrationViewModel?
    
    var registrationNavigation: RegistrationNavigationController?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.addNavigationButtons()
    }
    
    // MARK: - Methods
    
    func addNavigationButtons() {
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .next,
                                                            action: #selector(nextButtonTapped),
                                                            target: self)])
    }
    
    @objc func nextButtonTapped() {
        if (self.nameTextField.text ?? "").isEmpty {
            print("Give us your name")
        } else {
            print("next")
        }
    }

}
