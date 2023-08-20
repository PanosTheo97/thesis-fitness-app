//
//  FavoriteActivitiesViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import UIKit

class FavoriteActivitiesViewController: UIViewController {
    
    // MARK: - IBProperties
    
    @IBOutlet weak var activityCollectionView: ActivityCollectionView! {
        didSet {
            activityCollectionView.isInEditMode = true
        }
    }
    
    @IBOutlet weak var activityTitleLabel: UILabel! {
        didSet {
            activityTitleLabel.textColor = .App.mainText
            activityTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            activityTitleLabel.text = "Activity_pickYourFavorites".getLocalized()
        }
    }
    
    @IBOutlet weak var registrationPageControll: UIPageControl! {
        didSet {
            registrationPageControll.numberOfPages = 5
            registrationPageControll.currentPage = 3
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
        self.setupCollectionView()
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
    
    func setupCollectionView() {
        var activityModels: [ActivityCollectionViewModel] = []
        
        for activity in ActivityEnum.allCases {
            activityModels.append(ActivityCollectionViewModel(type: activity, isFavorite: false))
        }
        
        self.activityCollectionView.setup(data: activityModels)
    }
    
    @objc func backButtonTapped() {
        self.registrationNavigation?.flowCoordinator?.pop()
    }
    
    @objc func nextButtonTapped() {
        var favoriteActivities: [ActivityEnum] = []
        self.activityCollectionView.data.forEach { activity in
            if activity.isFavorite { favoriteActivities.append(activity.type) }
        }
        self.viewModel?.setUserFavoriteActivities(favoriteActivities: favoriteActivities)
        self.registrationNavigation?.flowCoordinator?.moveToDietGoals()
    }

}
