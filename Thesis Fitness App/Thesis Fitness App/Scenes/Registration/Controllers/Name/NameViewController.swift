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
            nameTextField.keyboardType = .alphabet
            nameTextField.backgroundColor = .App.mainText
            nameTextField.layer.cornerRadius = 4
            nameTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            nameTextField.placeholder = "Registration_Name_placeholder".getLocalized()
            nameTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var registrationPageControll: UIPageControl! {
        didSet {
            registrationPageControll.numberOfPages = 5
            registrationPageControll.currentPage = 0
            registrationPageControll.currentPageIndicatorTintColor = .App.mainText
            registrationPageControll.pageIndicatorTintColor = .systemGray
            registrationPageControll.isUserInteractionEnabled = false
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
        guard let name = self.nameTextField.text, !name.isEmpty else {
            return
        }
        self.viewModel?.setUserName(name: name)
        self.registrationNavigation?.flowCoordinator?.moveToBodyComposition()
    }

}
