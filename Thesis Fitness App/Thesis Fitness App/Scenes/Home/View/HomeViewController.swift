//
//  HomeViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit
import CoreMotion

class HomeViewController: UIViewController, BaseProtocol, TabBarViewControllerProtocol {

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
            bodyweightLabel.text = "-"
        }
    }
    
    @IBOutlet weak var muscleLabel: UILabel! {
        didSet {
            muscleLabel.font = .systemFont(ofSize: 16, weight: .bold)
            muscleLabel.textColor = .App.mainText
            muscleLabel.text = "-"
        }
    }
    
    @IBOutlet weak var fatLabel: UILabel! {
        didSet {
            fatLabel.font = .systemFont(ofSize: 16, weight: .bold)
            fatLabel.textColor = .App.mainText
            fatLabel.text = "-"
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
            caloriesTitleLabel.text = "Home_caloriesTitleLabel".getLocalized()
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
            stepsTitleLabel.text = "Home_stepsTitleLabel".getLocalized()
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
    
    @IBOutlet weak var backgroundShadowView: UIView! {
        didSet {
            backgroundShadowView.backgroundColor = UIColor(hexString: "#ECEEF5")
            backgroundShadowView.layer.cornerRadius = 8
        }
    }
    
    @IBOutlet weak var cellView: UIView! {
        didSet {
            cellView.layer.masksToBounds = true
            cellView.layer.cornerRadius = 8
            cellView.backgroundColor = .secondarySystemGroupedBackground
        }
    }
    
    @IBOutlet weak var customCircleView: CustomCircleView! {
        didSet {
            customCircleView.backgroundColor = .clear
            self.customCircleView.configure(circleViewTypeEnum: .half,
                                            macroTypeEnum: .protein,
                                            maxQuantity: 240,
                                            consumedQuantity: 60)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
            titleLabel.textColor = .label
            titleLabel.text = "Play for time (min.)"
        }
    }
    
    @IBOutlet weak var activityTypeLabel: UILabel! {
        didSet {
            activityTypeLabel.font = .systemFont(ofSize: 14, weight: .medium)
            activityTypeLabel.text = "Ping Pong"
            activityTypeLabel.textColor = .label
        }
    }
    
    @IBOutlet weak var activityImageView: UIImageView! {
        didSet {
            activityImageView.contentMode = .scaleAspectFit
            activityImageView.image = .init(systemName: "figure.table.tennis")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        }
    }
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel?
    var flowCoordinator: HomeFlowCoordinator?
    
    weak var lobbyTabBarController: LobbyTabBarController?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        //self.viewModel?.executeHomePedometerUseCase()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.executeHomeSetupUseCase()
    }

    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .systemBackground
        self.backgroundShadowView.dropShadow(offset: CGSize(width: 0, height: 5), radius: 2, color: .lightGray)
        self.addEditButton()
        
        let pedometer = CMPedometer()
        
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date()) { pedometerData, error in
                guard let pedometerData = pedometerData, error == nil else { return }
                DispatchQueue.main.async {
                    if let stepsGoal = self.lobbyTabBarController?.viewModel?.user?.dailyStepGoal {
                        self.stepsLabel.text = "\(pedometerData.numberOfSteps.intValue)/\(stepsGoal)"
                    } else {
                        self.stepsLabel.text = "\(pedometerData.numberOfSteps.intValue)"
                    }
                }
            }
        }
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            default: ()
            }
        })
        
        viewModel?.user.addObserver({ [weak self] user in
            guard let user = user else {
                return
            }
            self?.configureUI(user: user)
            self?.lobbyTabBarController?.viewModel?.user = user
        })
        
        viewModel?.stepCounter.addObserver({ [weak self] steps in
            if let stepsGoal = self?.lobbyTabBarController?.viewModel?.user?.dailyStepGoal {
                self?.stepsLabel.text = "\(steps)/\(stepsGoal)"
            } else {
                self?.stepsLabel.text = "\(steps)"
            }
        })
        
    }
    
    func configureUI(user: UserModel) {
        
        self.displayNameLabel.text = String(format: "Home_displayNameLabel".getLocalized(), user.name)
        self.displayNameLabel.isHidden = false
        
        if let imageUrl = AccountManager.shared.user?.photoURL {
            self.profileImageView.displayImage(url: imageUrl, placeholder: nil)
        } else {
            self.profileImageView.image = .init(systemName: "person.fill")
        }
        
        self.bodyweightLabel.text = "\(user.bodyweight)kg"
        
        if let muscle = user.musclePercentage {
            self.muscleLabel.text = "\(muscle)%"
        } else {
            self.muscleLabel.text = "-"
        }
        
        if let fat = user.fatPercentage {
            self.fatLabel.text = "\(fat)%"
        } else {
            self.fatLabel.text = "-"
        }
        
        if let calories = user.dailyCalorieBurnGoal {
            self.caloriesLabel.text = "0/\(calories)"
        } else {
            self.caloriesLabel.text = "0"
        }
        
        if let steps = user.dailyStepGoal {
            self.stepsLabel.text = "0/\(steps)"
        } else {
            self.stepsLabel.text = "0"
        }
        
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
