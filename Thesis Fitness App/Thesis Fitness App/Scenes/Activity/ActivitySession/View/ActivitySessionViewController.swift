//
//  ActivitySessionViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 2/8/23.
//

import UIKit
import Lottie

class ActivitySessionViewController: UIViewController, BaseProtocol {
    
    // MARK: - IBProperties
    
    @IBOutlet weak var countdownAnimationView: LottieAnimationView! {
        didSet {
            countdownAnimationView.contentMode = .scaleAspectFit
            countdownAnimationView.loopMode = .playOnce
            countdownAnimationView.animationSpeed = 1
        }
    }
    
    @IBOutlet weak var playPauseButton: UIButton! {
        didSet {
            playPauseButton.backgroundColor = .App.mainText
            playPauseButton.clipsToBounds = true
            playPauseButton.layer.cornerRadius = playPauseButton.frame.size.width / 2
            playPauseButton.setTitle("", for: .normal)
            playPauseButton.setImage(.init(systemName: "play.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    @IBOutlet weak var stopButton: UIButton! {
        didSet {
            stopButton.backgroundColor = .systemGray
            stopButton.clipsToBounds = true
            stopButton.layer.cornerRadius = playPauseButton.frame.size.width / 2
            stopButton.setTitle("", for: .normal)
            stopButton.setImage(.init(systemName: "stop.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
            
            stopButton.isEnabled = false
        }
    }
    
    @IBOutlet weak var breakTitleLabel: UILabel! {
        didSet {
            breakTitleLabel.textColor = .label
            breakTitleLabel.font = .systemFont(ofSize: 12, weight: .semibold)
            breakTitleLabel.text = "ActivitySession_breakTitleLabel".getLocalized()
        }
    }
    
    @IBOutlet weak var breakLabel: UILabel! {
        didSet {
            breakLabel.textColor = .label
            breakLabel.font = .systemFont(ofSize: 16, weight: .bold)
            breakLabel.text = "-"
        }
    }
    
    @IBOutlet weak var paceTitleLabel: UILabel! {
        didSet {
            paceTitleLabel.textColor = .label
            paceTitleLabel.font = .systemFont(ofSize: 12, weight: .semibold)
            paceTitleLabel.text = "ActivitySession_paceTitleLabel".getLocalized()
        }
    }
    
    @IBOutlet weak var paceLabel: UILabel! {
        didSet {
            paceLabel.textColor = .label
            paceLabel.font = .systemFont(ofSize: 16, weight: .bold)
            paceLabel.text = "-"
        }
    }
    
    @IBOutlet weak var distanceTitleLabel: UILabel! {
        didSet {
            distanceTitleLabel.textColor = .label
            distanceTitleLabel.font = .systemFont(ofSize: 12, weight: .semibold)
            distanceTitleLabel.text = "ActivitySession_distanceTitleLabel".getLocalized()
        }
    }
    
    @IBOutlet weak var distanceLabel: UILabel! {
        didSet {
            distanceLabel.textColor = .label
            distanceLabel.font = .systemFont(ofSize: 16, weight: .bold)
            distanceLabel.text = "-"
        }
    }
    
    @IBOutlet weak var timeLabel: UILabel! {
        didSet {
            timeLabel.textColor = .label
            timeLabel.font = .systemFont(ofSize: 36, weight: .bold)
            timeLabel.text = "00:00:00:00"
        }
    }
    
    // MARK: - Properties
    
    var viewModel: ActivitySessionViewModel?
    var flowCoordinator: ActivitySessionFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
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
            case .dismiss:
                self?.flowCoordinator?.dismiss()
            default: ()
            }
        })
        
    }
    
    func addNavigationButtons() {
        self.navigationItem.addButtons(barButtonPositionEnum: .left,
                                       navigationButtons: [(navigationButtonTypeEnum: .close,
                                                            action: #selector(closeButtonTapped),
                                                            target: self)])
    }
    
    @objc func closeButtonTapped() {
        self.viewModel?.update(routing: .dismiss)
    }

    // MARK: - IBMethods
    
    @IBAction func playPauseButtonTapped(_ sender: Any) {
        self.countdownAnimationView.play(completion: { _ in
            UIView.animate(withDuration: 0.4, animations: {
                self.countdownAnimationView.alpha = 0.0
            })
            self.stopButton.backgroundColor = .App.mainText
            self.stopButton.isEnabled = true
            self.playPauseButton.setImage(.init(systemName: "pause.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
        })
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        // LongPrees to stop (Maybe with animation )
    }
}

struct ActivitySession {
    enum RoutingEnum {
        case dismiss
        case save
    }
}
