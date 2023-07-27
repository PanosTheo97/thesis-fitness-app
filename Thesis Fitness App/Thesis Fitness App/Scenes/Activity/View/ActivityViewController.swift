//
//  ActivityViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit

class ActivityViewController: UIViewController, BaseProtocol {

    // MARK: - IBProperties
    
    @IBOutlet weak var activityCollectionView: ActivityCollectionView! {
        didSet {
            activityCollectionView.activityCollectionViewDelegate = self
        }
    }
    
    // MARK: - Properties
    
    var viewModel: ActivityViewModel?
    var flowCoordinator: ActivityFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.viewModel?.executeActivitySetupuseCase()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        // Reset the view in case of edit mode
        
        self.addNavigationButtons()
        self.activityCollectionView.isInEditMode = false
        self.activityCollectionView.setup(data: self.viewModel?.activityData.value ?? [])
    }
    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .systemBackground
        self.addNavigationButtons()
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            default: ()
            }
        })
        
        viewModel?.activityData.addObserver({ [weak self] activityData in
            self?.activityCollectionView.setup(data: activityData)
        })
        
    }
    
    func addNavigationButtons() {
    
        self.navigationItem.addTitle(title: "Lobby_activityTitle".getLocalized())
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .history,
                                                            action: #selector(editButtonTapped),
                                                            target: self),
                                                           (navigationButtonTypeEnum: .edit,
                                                                                action: #selector(editButtonTapped),
                                                                                target: self)])
    }
    
    @objc func editButtonTapped() {
        self.activityCollectionView.isInEditMode = true
        self.activityCollectionView.reloadData()
        
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .checkmark,
                                                            action: #selector(checkButtonTapped),
                                                            target: self)])
    }
    
    @objc func checkButtonTapped() {
        
        // Use case to actually save updated favorites
        
        self.viewModel?.activityData.value = self.activityCollectionView.data
        
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .history,
                                                            action: #selector(editButtonTapped),
                                                            target: self),
                                                           (navigationButtonTypeEnum: .edit,
                                                                                action: #selector(editButtonTapped),
                                                                                target: self)])
        self.activityCollectionView.isInEditMode = false
        self.activityCollectionView.reloadData()
    }
    
    @objc func historyButtonTapped() {
        print("History")
    }
}

struct Activity {
    enum RoutingEnum {
        case test
    }
}
