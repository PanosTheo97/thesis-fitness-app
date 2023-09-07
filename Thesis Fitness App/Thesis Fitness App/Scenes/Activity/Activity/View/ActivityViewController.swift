//
//  ActivityViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit

class ActivityViewController: UIViewController, BaseProtocol, TabBarViewControllerProtocol {

    // MARK: - IBProperties
    
    @IBOutlet weak var activityCollectionView: ActivityCollectionView! {
        didSet {
            activityCollectionView.activityCollectionViewDelegate = self
        }
    }
    
    @IBOutlet weak var activityTitleLabel: UILabel! {
        didSet {
            activityTitleLabel.textColor = .App.mainText
            activityTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            activityTitleLabel.text = "Activity_activityTitleLabel".getLocalized()
        }
    }
    // MARK: - Properties
    
    var viewModel: ActivityViewModel?
    var flowCoordinator: ActivityFlowCoordinator?
    
    weak var lobbyTabBarController: LobbyTabBarController?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showTabBar()
        self.viewModel?.executeActivitySetupUseCase(favoriteActivities: self.lobbyTabBarController?.viewModel?.user?.favoriteActivities ?? [])
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
            case .activityParameter(let activityId):
                self?.flowCoordinator?.moveToActivityParameter(activityId: activityId)
            default: ()
            }
        })
        
        viewModel?.activityData.addObserver({ [weak self] activityData in
            self?.activityCollectionView.setup(data: activityData)
        })
        
        viewModel?.updatedFavorites.addObserver({ newFavorites in
            guard let favorites = newFavorites else {
                return
            }
            self.lobbyTabBarController?.viewModel?.user?.favoriteActivities = favorites
        })
        
    }
    
    func addNavigationButtons() {
    
        self.navigationItem.addTitle(title: "Lobby_activityTitle".getLocalized())
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .history,
                                                            action: #selector(historyButtonTapped),
                                                            target: self),
                                                           (navigationButtonTypeEnum: .edit,
                                                                                action: #selector(editButtonTapped),
                                                                                target: self)])
    }
    
    @objc func editButtonTapped() {
        self.activityTitleLabel.text = "Activity_pickYourFavorites".getLocalized()
        
        self.activityCollectionView.isInEditMode = true
        self.activityCollectionView.reloadData()
        
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .checkmark,
                                                            action: #selector(checkButtonTapped),
                                                            target: self)])
    }
    
    @objc func checkButtonTapped() {
        
        self.viewModel?.executeActivityUpdateFavoritesUseCase(activities: self.activityCollectionView.data)
        self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                       navigationButtons: [(navigationButtonTypeEnum: .history,
                                                            action: #selector(editButtonTapped),
                                                            target: self),
                                                           (navigationButtonTypeEnum: .edit,
                                                                                action: #selector(editButtonTapped),
                                                                                target: self)])
        self.activityTitleLabel.text = "Activity_activityTitleLabel".getLocalized()
        self.activityCollectionView.isInEditMode = false
        self.activityCollectionView.reloadData()
    }
    
    @objc func historyButtonTapped() {
        print("History")
    }
}

struct Activity {
    enum RoutingEnum {
        case activityParameter(activityId: String)
    }
}
