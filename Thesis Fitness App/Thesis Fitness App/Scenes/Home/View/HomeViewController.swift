//
//  HomeViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit

class HomeViewController: UIViewController, BaseProtocol {

    // MARK: - IBProperties
    
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
            profileImageView.layer.borderColor = UIColor.App.mainText.cgColor
            profileImageView.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var displayNameLabel: UILabel! {
        didSet {
            displayNameLabel.font = .systemFont(ofSize: 22, weight: .bold)
            displayNameLabel.textColor = .App.mainText
            displayNameLabel.isHidden = true
        }
    }
    
    @IBOutlet weak var bodyweightLabel: UILabel! {
        didSet {
            bodyweightLabel.font = .systemFont(ofSize: 16, weight: .bold)
            bodyweightLabel.textColor = .App.mainText
            bodyweightLabel.text = "75.5kg"
        }
    }
    
    @IBOutlet weak var muscleLabel: UILabel! {
        didSet {
            muscleLabel.font = .systemFont(ofSize: 16, weight: .bold)
            muscleLabel.textColor = .App.mainText
        }
    }
    
    @IBOutlet weak var fatLabel: UILabel! {
        didSet {
            fatLabel.font = .systemFont(ofSize: 16, weight: .bold)
            fatLabel.textColor = .App.mainText
        }
    }
    
    @IBOutlet weak var bodyweightImageView: UIImageView! {
        didSet {
            bodyweightImageView.tintColor = .label
            bodyweightImageView.image = .init(systemName: "scalemass")
        }
    }
    
    @IBOutlet weak var muscleImageView: UIImageView! {
        didSet {
            muscleImageView.tintColor = .label
            muscleImageView.image = .init(systemName: "figure.strengthtraining.traditional")
        }
    }
    
    @IBOutlet weak var fatImageView: UIImageView! {
        didSet {
            fatImageView.tintColor = .label
            fatImageView.image = .init(systemName: "allergens")
        }
    }
    
    @IBOutlet weak var caloriesTitleLabel: UILabel! {
        didSet {
            caloriesTitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
            caloriesTitleLabel.textColor = .label
            caloriesTitleLabel.text = "Calories"
        }
    }
    
    @IBOutlet weak var caloriesImageView: UIImageView! {
        didSet {
            caloriesImageView.tintColor = .label
            caloriesImageView.image = .init(systemName: "flame.fill")
        }
    }
    
    @IBOutlet weak var caloriesLabel: UILabel! {
        didSet {
            caloriesLabel.font = .systemFont(ofSize: 16, weight: .bold)
            caloriesLabel.textColor = .App.mainText
        }
    }
    
    @IBOutlet weak var stepsTitleLabel: UILabel! {
        didSet {
            stepsTitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
            stepsTitleLabel.textColor = .label
            stepsTitleLabel.text = "Steps"
        }
    }
    
    @IBOutlet weak var stepsImageView: UIImageView! {
        didSet {
            stepsImageView.tintColor = .label
            stepsImageView.image = .init(systemName: "figure.walk")
        }
    }
    
    @IBOutlet weak var stepsLabel: UILabel! {
        didSet {
            stepsLabel.font = .systemFont(ofSize: 16, weight: .bold)
            stepsLabel.textColor = .App.mainText
        }
    }
    
    @IBOutlet weak var activitiesTitleLabel: UILabel! {
        didSet {
            activitiesTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            activitiesTitleLabel.textColor = .App.mainText
            activitiesTitleLabel.text = "Activity Challenges"
        }
    }
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel?
    var flowCoordinator: HomeFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        
        NetworkManager.getDocument(FUserModel.self, .users, "2PO4dJTwIVooO03bC4iX") { result in
            switch result {
            case .success(let user):
                print(user.bodyweight)
            case .failure:
                print("ERROR")
            }
        }
    }

    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .systemBackground
        self.addEditButton()
        
        #warning("setup Use Case needed")
        
        if let name = self.viewModel?.user.name {
            self.displayNameLabel.text = String(format: "Home_displayNameLabel".getLocalized(), name)
            self.displayNameLabel.isHidden = false
        }
        
        if let imageUrl = AccountManager.shared.user?.photoURL {
            self.profileImageView.displayImage(url: imageUrl, placeholder: nil)
        } else {
            self.profileImageView.image = .init(systemName: "person.fill")
        }
        
        if let bodyweight = self.viewModel?.user.bodyweight {
            self.bodyweightLabel.text = "\(bodyweight)kg"
        }
        
        if let muscle = self.viewModel?.user.musclePercentage {
            self.muscleLabel.text = "\(muscle)%"
        } else {
            self.muscleLabel.text = "-"
        }
        
        if let fat = self.viewModel?.user.fatPercentage {
            self.fatLabel.text = "\(fat)%"
        } else {
            self.fatLabel.text = "-"
        }
        
        if let calories = self.viewModel?.user.dailyCalorieBurnGoal {
            self.caloriesLabel.text = "0/\(calories)"
        } else {
            self.caloriesLabel.text = "0"
        }
        
        if let steps = self.viewModel?.user.dailyStepGoal {
            self.stepsLabel.text = "0/\(steps)"
        } else {
            self.stepsLabel.text = "0"
        }
        
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            default: ()
            }
        })
        
    }
    
    func addEditButton() {
        self.navigationItem.addTitle(title: "Lobby_homeTitle".getLocalized())
//        self.navigationItem.addButtons(barButtonPositionEnum: .right,
//                                       navigationButtons: [(navigationButtonTypeEnum: .edit,
//                                                            action: #selector(editButtonTapped),
//                                                            target: self)])
    }
    
    @objc func editButtonTapped() {
        print("Edit")
    }

}

struct Home {
    enum RoutingEnum {
        case test
    }
}
