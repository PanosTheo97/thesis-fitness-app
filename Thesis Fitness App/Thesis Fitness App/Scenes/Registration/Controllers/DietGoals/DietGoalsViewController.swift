//
//  DietGoalsViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import UIKit

class DietGoalsViewController: UIViewController {

    // MARK: - IBProperties
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .App.mainText
            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            titleLabel.text = "Registration_DietyGoals_titleLabel".getLocalized()
        }
    }
    
    @IBOutlet weak var caloriesTextField: UITextField! {
        didSet {
            caloriesTextField.delegate = self
            caloriesTextField.borderStyle = .none
            caloriesTextField.tintColor = .label
            caloriesTextField.textColor = .label
            caloriesTextField.keyboardType = .decimalPad
            caloriesTextField.backgroundColor = .App.mainText
            caloriesTextField.layer.cornerRadius = 4
            caloriesTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            caloriesTextField.placeholder = "Registration_DietGoals_caloriesPlaceholder".getLocalized()
            caloriesTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var proteinTextField: UITextField! {
        didSet {
            proteinTextField.delegate = self
            proteinTextField.borderStyle = .none
            proteinTextField.tintColor = .label
            proteinTextField.textColor = .label
            proteinTextField.keyboardType = .decimalPad
            proteinTextField.backgroundColor = .App.mainText
            proteinTextField.layer.cornerRadius = 4
            proteinTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            proteinTextField.placeholder = "Registration_DietGoals_proteinPlaceholder".getLocalized()
            proteinTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var carbsTextField: UITextField! {
        didSet {
            carbsTextField.delegate = self
            carbsTextField.borderStyle = .none
            carbsTextField.tintColor = .label
            carbsTextField.textColor = .label
            carbsTextField.keyboardType = .decimalPad
            carbsTextField.backgroundColor = .App.mainText
            carbsTextField.layer.cornerRadius = 4
            carbsTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            carbsTextField.placeholder = "Registration_DietGoals_carbsPlaceholder".getLocalized()
            carbsTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var fatsTextField: UITextField! {
        didSet {
            fatsTextField.delegate = self
            fatsTextField.borderStyle = .none
            fatsTextField.tintColor = .label
            fatsTextField.textColor = .label
            fatsTextField.keyboardType = .decimalPad
            fatsTextField.backgroundColor = .App.mainText
            fatsTextField.layer.cornerRadius = 4
            fatsTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            fatsTextField.placeholder = "Registration_DietGoals_fatsPlaceholder".getLocalized()
            fatsTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var waterTextField: UITextField! {
        didSet {
            waterTextField.delegate = self
            waterTextField.borderStyle = .none
            waterTextField.tintColor = .label
            waterTextField.textColor = .label
            waterTextField.keyboardType = .decimalPad
            waterTextField.backgroundColor = .App.mainText
            waterTextField.layer.cornerRadius = 4
            waterTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            waterTextField.placeholder = "Registration_DietGoals_waterPlaceholder".getLocalized()
            waterTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var registrationPageControll: UIPageControl! {
        didSet {
            registrationPageControll.numberOfPages = 5
            registrationPageControll.currentPage = 4
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
                                       navigationButtons: [(navigationButtonTypeEnum: .done,
                                                            action: #selector(doneButtonTapped),
                                                            target: self)])
    }
    
    @objc func backButtonTapped() {
        self.registrationNavigation?.flowCoordinator?.pop()
    }
    
    @objc func doneButtonTapped() {
        self.viewModel?.setUserDietGoals(calorieGoal: self.caloriesTextField.text ?? "0",
                                         proteinGoal: self.proteinTextField.text ?? "0",
                                         carbGoal: self.carbsTextField.text  ?? "0",
                                         fatsGoal: self.fatsTextField.text ?? "0",
                                         waterGoal: self.waterTextField.text  ?? "0")
        
        self.viewModel?.executeRegistrationAddUserUseCase(completion: { status in
            if status {
                self.registrationNavigation?.flowCoordinator?.moveToLobby()
            }
        })
    }

}
