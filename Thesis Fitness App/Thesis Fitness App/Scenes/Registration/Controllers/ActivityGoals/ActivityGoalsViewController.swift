//
//  ActivityGoalsViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import UIKit

class ActivityGoalsViewController: UIViewController {

    // MARK: - IBProperties
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .App.mainText
            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            titleLabel.text = "Registration_ActivityGoals_titleLabel".getLocalized()
        }
    }
    
    @IBOutlet weak var stepsTextField: UITextField! {
        didSet {
            stepsTextField.delegate = self
            stepsTextField.borderStyle = .none
            stepsTextField.tintColor = .label
            stepsTextField.textColor = .label
            stepsTextField.keyboardType = .decimalPad
            stepsTextField.backgroundColor = .App.mainText
            stepsTextField.layer.cornerRadius = 4
            stepsTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            stepsTextField.attributedPlaceholder = NSAttributedString(
                string: "Registration_ActivityGoals_stepsPlaceholder".getLocalized(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.label.withAlphaComponent(0.6)]
            )
            stepsTextField.setLeftPaddingPoints(10)
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
            caloriesTextField.attributedPlaceholder = NSAttributedString(
                string: "Registration_ActivityGoals_caloriesPlaceholder".getLocalized(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.label.withAlphaComponent(0.6)]
            )
            caloriesTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var registrationPageControll: UIPageControl! {
        didSet {
            registrationPageControll.numberOfPages = 5
            registrationPageControll.currentPage = 2
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
        self.viewModel?.setUserActivityGoals(dailyStepGoal: Int(self.stepsTextField.text ?? ""),
                                             dailyCalorieBurnGoal: Int(self.caloriesTextField.text ?? ""))
        self.registrationNavigation?.flowCoordinator?.moveToFavoriteActivities()
    }

}
