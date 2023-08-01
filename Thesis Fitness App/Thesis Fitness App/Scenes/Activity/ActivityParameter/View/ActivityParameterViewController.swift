//
//  ActivityParameterViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 29/7/23.
//

import UIKit

class ActivityParameterViewController: UIViewController, BaseProtocol, TabBarViewControllerProtocol {

    // MARK: - IBProperties
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .App.mainText
            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            titleLabel.text = "ActivityParameter_titleLabel".getLocalized()
        }
    }
    
    @IBOutlet weak var parameterButton: UIButton! {
        didSet {
            parameterButton.applyStyle(buttonStyleEnum: .underlined(text: "ActivityParameter_parameterButton".getLocalized(),
                                                                    textColor: .App.mainText,
                                                                    font: .systemFont(ofSize: 16, weight: .semibold)))
            if #available(iOS 14.0, *) {
                parameterButton.showsMenuAsPrimaryAction = true
                parameterButton.menu = parametersMenu
            }
        }
    }
    @IBOutlet weak var parameterValueTextField: UITextField! {
        didSet {
            parameterValueTextField.borderStyle = .none
            parameterValueTextField.tintColor = .label
            parameterValueTextField.textColor = .label
            parameterValueTextField.keyboardType = .numberPad
            parameterValueTextField.delegate = self
            parameterValueTextField.backgroundColor = .App.mainText
            parameterValueTextField.layer.cornerRadius = 4
            parameterValueTextField.isHidden = true
            parameterValueTextField.font = .systemFont(ofSize: 16, weight: .semibold)
            parameterValueTextField.setLeftPaddingPoints(10)
        }
    }
    // MARK: - Properties
    
    var viewModel: ActivityParameterViewModel?
    var flowCoordinator: ActivityParameterFlowCoordinator?
    
    #warning("Menu Items created at view model after call")
    var menuItems: [UIAction] {
        return [
            UIAction(title: "Time (in min.)", image: UIImage(systemName: "stopwatch")?.withTintColor(.App.mainText, renderingMode: .alwaysOriginal), handler: { (_) in
                self.parameterButton.applyStyle(buttonStyleEnum: .simple(text: "Time (in min.)",
                                                                    textColor: .App.mainText,
                                                                    font: .systemFont(ofSize: 16, weight: .semibold)))
                self.parameterValueTextField.isHidden = false
                self.parameterValueTextField.becomeFirstResponder()
                self.parameterValueTextField.text = ""
            }),
            UIAction(title: "Distance (in m.)", image: UIImage(systemName: "road.lanes")?.withTintColor(.App.mainText, renderingMode: .alwaysOriginal), handler: { (_) in
                self.parameterButton.applyStyle(buttonStyleEnum: .simple(text: "Distance (in m.)",
                                                                    textColor: .App.mainText,
                                                                    font: .systemFont(ofSize: 16, weight: .semibold)))
                self.parameterValueTextField.isHidden = false
                self.parameterValueTextField.becomeFirstResponder()
                self.parameterValueTextField.text = ""
            })
        ]
    }

    var parametersMenu: UIMenu {
        return UIMenu(title: "Activity Goals", image: nil, identifier: nil, options: [], children: menuItems)
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.viewModel?.executeActivityParameterSetupuseCase()
    }
    
    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .systemBackground
        self.addNavigationButtons()
        self.hideTabBar()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            case .back:
                self?.flowCoordinator?.pop()
            default: ()
            }
        })
        
    }
    
    func addNavigationButtons() {
        self.navigationItem.addButtons(barButtonPositionEnum: .left,
                                       navigationButtons: [(navigationButtonTypeEnum: .back,
                                                            action: #selector(backButtonTapped),
                                                            target: self)])
    }
    
    @objc func backButtonTapped() {
        self.viewModel?.update(routing: .back)
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        self.parameterValueTextField.resignFirstResponder()
    }
}

struct ActivityParameter {
    enum RoutingEnum {
        case back
    }
}
