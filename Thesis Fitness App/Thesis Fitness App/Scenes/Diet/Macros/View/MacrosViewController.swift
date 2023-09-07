//
//  MacrosViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/8/23.
//

import UIKit

protocol MacrosViewControllerProtocol: AnyObject {
    func addMacros(data: [DietModel])
}

class MacrosViewController: UIViewController, BaseProtocol {

    // MARK: - IBProperties
    
    @IBOutlet weak var mainView: UIView! {
        didSet {
            mainView.backgroundColor = .secondarySystemGroupedBackground
        }
    }
    
    @IBOutlet weak var exitButton: UIButton! {
        didSet {
            exitButton.setTitle("", for: .normal)
            exitButton.tintColor = .systemRed
            exitButton.setImage(.init(systemName: "xmark"), for: .normal)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .App.mainText
            titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
            titleLabel.text = "Macros_titleLabel".getLocalized()
        }
    }
    
    @IBOutlet weak var caloriesTextField: UITextField! {
        didSet {
            caloriesTextField.borderStyle = .none
            caloriesTextField.tintColor = .label
            caloriesTextField.textColor = .label
            caloriesTextField.keyboardType = .numberPad
            caloriesTextField.delegate = self
            caloriesTextField.backgroundColor = .App.mainText
            caloriesTextField.layer.cornerRadius = 4
            caloriesTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            caloriesTextField.attributedPlaceholder = NSAttributedString(
                string: "Macros_placeholder_calories".getLocalized(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.label.withAlphaComponent(0.6)]
            )
            caloriesTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var proteinTextField: UITextField! {
        didSet {
            proteinTextField.borderStyle = .none
            proteinTextField.tintColor = .label
            proteinTextField.textColor = .label
            proteinTextField.keyboardType = .numberPad
            proteinTextField.delegate = self
            proteinTextField.backgroundColor = .App.mainText
            proteinTextField.layer.cornerRadius = 4
            proteinTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            proteinTextField.attributedPlaceholder = NSAttributedString(
                string: "Macros_placeholder_protein".getLocalized(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.label.withAlphaComponent(0.6)]
            )
            proteinTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var carbsTextField: UITextField! {
        didSet {
            carbsTextField.borderStyle = .none
            carbsTextField.tintColor = .label
            carbsTextField.textColor = .label
            carbsTextField.keyboardType = .numberPad
            carbsTextField.delegate = self
            carbsTextField.backgroundColor = .App.mainText
            carbsTextField.layer.cornerRadius = 4
            carbsTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            carbsTextField.attributedPlaceholder = NSAttributedString(
                string: "Macros_placeholder_carbohydrates".getLocalized(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.label.withAlphaComponent(0.6)]
            )
            carbsTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var fatsTextField: UITextField! {
        didSet {
            fatsTextField.borderStyle = .none
            fatsTextField.tintColor = .label
            fatsTextField.textColor = .label
            fatsTextField.keyboardType = .numberPad
            fatsTextField.delegate = self
            fatsTextField.backgroundColor = .App.mainText
            fatsTextField.layer.cornerRadius = 4
            fatsTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            fatsTextField.attributedPlaceholder = NSAttributedString(
                string: "Macros_placeholder_fats".getLocalized(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.label.withAlphaComponent(0.6)]
            )
            fatsTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var waterTextField: UITextField! {
        didSet {
            waterTextField.borderStyle = .none
            waterTextField.tintColor = .label
            waterTextField.textColor = .label
            waterTextField.keyboardType = .numberPad
            waterTextField.delegate = self
            waterTextField.backgroundColor = .App.mainText
            waterTextField.layer.cornerRadius = 4
            waterTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            waterTextField.attributedPlaceholder = NSAttributedString(
                string: "Macros_placeholder_water".getLocalized(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.label.withAlphaComponent(0.6)]
            )
            waterTextField.setLeftPaddingPoints(10)
        }
    }
    
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            self.saveButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .systemGray,
                                                             textColor: .label,
                                                             text: "Macros_saveButton".getLocalized(),
                                                             font: .systemFont(ofSize: 28, weight: .black)))
        }
    }
    
    // MARK: - Properties
    
    var viewModel: MacrosViewModel?
    var flowCoordinator: MacrosFlowCoordinator?
    
    weak var macrosViewControllerDelegate: MacrosViewControllerProtocol?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .clear
        self.mainView.roundCorners(corners: [.topLeft, .topRight], radius: 12)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            case .dismiss:
                self?.flowCoordinator?.dismiss()
            default: ()
            }
        })
        
        viewModel?.updatedDietData.addObserver({ [weak self] data in
            self?.macrosViewControllerDelegate?.addMacros(data: data)
        })
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        if self.caloriesTextField.isFirstResponder { self.caloriesTextField.resignFirstResponder() }
        if self.proteinTextField.isFirstResponder { self.proteinTextField.resignFirstResponder() }
        if self.carbsTextField.isFirstResponder { self.carbsTextField.resignFirstResponder() }
        if self.fatsTextField.isFirstResponder { self.fatsTextField.resignFirstResponder() }
        if self.waterTextField.isFirstResponder { self.waterTextField.resignFirstResponder() }
    }
    
    func updateSaveButton(isEnabled: Bool) {
        saveButton.isEnabled = isEnabled
        if isEnabled {
            self.saveButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .App.mainText,
                                                             textColor: .label,
                                                             text: "Macros_saveButton".getLocalized(),
                                                             font: .systemFont(ofSize: 28, weight: .black)))
        } else {
            self.saveButton.applyStyle(buttonStyleEnum: .rounded(backgroundcolor: .systemGray,
                                                             textColor: .label,
                                                             text: "Macros_saveButton".getLocalized(),
                                                             font: .systemFont(ofSize: 28, weight: .black)))
        }
    }
    
    // MARK: - IBMethods
    
    @IBAction func exitButtonAction(_ sender: UIButton) {
        self.viewModel?.update(routing: .dismiss)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        self.viewModel?.addMacros(caloriesValue: self.caloriesTextField.text,
                                  proteinValue: self.proteinTextField.text,
                                  carbsValue: self.carbsTextField.text,
                                  fatsValue: self.fatsTextField.text,
                                  waterValue: self.waterTextField.text)
    }
}

struct Macros {
    enum RoutingEnum {
        case dismiss
    }
}
