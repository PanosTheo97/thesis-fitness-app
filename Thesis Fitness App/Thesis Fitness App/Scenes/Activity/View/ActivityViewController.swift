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
            self?.activityCollectionView.data = activityData
        })
        
    }
    
    func addNavigationButtons() {
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .history,
                                                            action: #selector(editButtonTapped),
                                                            target: self),
                                                           (navigationButtonTypeEnum: .edit,
                                                                                action: #selector(editButtonTapped),
                                                                                target: self)])
    }
    
    @objc func editButtonTapped() {
        print("Edit")
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
