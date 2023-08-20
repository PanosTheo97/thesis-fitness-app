//
//  BodyCompositionViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import UIKit

class BodyCompositionViewController: UIViewController, RegistrationViewControllerProtocol {

    // MARK: - IBProperties
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .App.mainText
            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            titleLabel.text = "Registration_BodyComposition_titleLabel".getLocalized()
        }
    }
    
    @IBOutlet weak var bodyweightTextField: UITextField! {
        didSet {
            bodyweightTextField.delegate = self
            bodyweightTextField.borderStyle = .none
            bodyweightTextField.tintColor = .label
            bodyweightTextField.textColor = .label
            bodyweightTextField.keyboardType = .decimalPad
            bodyweightTextField.backgroundColor = .App.mainText
            bodyweightTextField.layer.cornerRadius = 4
            bodyweightTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            bodyweightTextField.placeholder = "Registration_BodyComposition_weightPlaceholder".getLocalized()
            bodyweightTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var muscleMassTextField: UITextField! {
        didSet {
            muscleMassTextField.delegate = self
            muscleMassTextField.borderStyle = .none
            muscleMassTextField.tintColor = .label
            muscleMassTextField.textColor = .label
            muscleMassTextField.keyboardType = .decimalPad
            muscleMassTextField.backgroundColor = .App.mainText
            muscleMassTextField.layer.cornerRadius = 4
            muscleMassTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            muscleMassTextField.placeholder = "Registration_BodyComposition_musclePlaceholder".getLocalized()
            muscleMassTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var fatMassTextField: UITextField! {
        didSet {
            fatMassTextField.delegate = self
            fatMassTextField.borderStyle = .none
            fatMassTextField.tintColor = .label
            fatMassTextField.textColor = .label
            fatMassTextField.keyboardType = .decimalPad
            fatMassTextField.backgroundColor = .App.mainText
            fatMassTextField.layer.cornerRadius = 4
            fatMassTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            fatMassTextField.placeholder = "Registration_BodyComposition_fatPlaceholder".getLocalized()
            fatMassTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var registrationPageControll: UIPageControl! {
        didSet {
            registrationPageControll.numberOfPages = 5
            registrationPageControll.currentPage = 1
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
        self.navigationItem.addButtons(barButtonPositionEnum: .left,
                                       navigationButtons: [(navigationButtonTypeEnum: .back,
                                                            action: #selector(backButtonTapped),
                                                            target: self)])
        
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .next,
                                                            action: #selector(nextButtonTapped),
                                                            target: self)])
    }
    
    @objc func backButtonTapped() {
        self.registrationNavigation?.flowCoordinator?.pop()
    }
    
    @objc func nextButtonTapped() {
        guard let bodyweight = self.bodyweightTextField.text, !bodyweight.isEmpty else {
            return
        }
        self.viewModel?.setUserBodyComposition(bodyweight: bodyweight,
                                               musclePercentage: self.muscleMassTextField.text,
                                               fatPercentage: self.fatMassTextField.text)
        self.registrationNavigation?.flowCoordinator?.moveToActivityGoals()
    }

}
