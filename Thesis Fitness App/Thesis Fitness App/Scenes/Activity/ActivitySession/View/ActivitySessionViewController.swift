//
//  ActivitySessionViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 2/8/23.
//

import UIKit
import Lottie
import MapKit

protocol ActivitySessionViewControllerProtocol: AnyObject {
    func dismissToActivity()
}

class ActivitySessionViewController: UIViewController, BaseProtocol, PopoverPresentingViewControllerProtocol {
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    // MARK: - IBProperties
    
    @IBOutlet weak var mapKitView: MKMapView!
    
    @IBOutlet weak var countdownAnimationView: LottieAnimationView! {
        didSet {
            countdownAnimationView.contentMode = .scaleAspectFit
            countdownAnimationView.loopMode = .playOnce
            countdownAnimationView.animationSpeed = 1
            
            var path = ""
            if self.traitCollection.userInterfaceStyle == .dark {
               path = Bundle.main.path(forResource: "anim_start_session_dark",
                                                ofType: "json") ?? ""
                countdownAnimationView.animation = LottieAnimation.filepath(path)
            } else {
                path = Bundle.main.path(forResource: "anim_start_session_light",
                                                ofType: "json") ?? ""
                
            }
            countdownAnimationView.animation = LottieAnimation.filepath(path)
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
            
            let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(stopButtonLongPress))
            longGesture.minimumPressDuration = 3
            stopButton.addGestureRecognizer(longGesture)
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
            timeLabel.font = .systemFont(ofSize: 60, weight: .bold)
            timeLabel.text = "00:00:00:00"
        }
    }
    
    // MARK: - Properties
    
    var viewModel: ActivitySessionViewModel?
    var flowCoordinator: ActivitySessionFlowCoordinator?
    
    var isPlayingState: Bool = false
    var firstTimePlaying: Bool = true
    
    weak var activitySessionViewControllerDelegate: ActivitySessionViewControllerProtocol?
    
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
        
        viewModel?.timeString.addObserver({ [weak self] timeString in
            self?.timeLabel.text = timeString
        })
        
        viewModel?.breakTimeString.addObserver({ [weak self] breakString in
            self?.breakLabel.text = breakString
        })
        
    }
    
    func addNavigationButtons() {
        self.navigationItem.addButtons(barButtonPositionEnum: .left,
                                       navigationButtons: [(navigationButtonTypeEnum: .close,
                                                            action: #selector(closeButtonTapped),
                                                            target: self)])
    }
    
    func updatePlayPauseButtonState() {
        if self.isPlayingState {
            self.playPauseButton.setImage(.init(systemName: "pause.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            self.playPauseButton.setImage(.init(systemName: "play.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
        }
        
    }
    
    @objc func closeButtonTapped() {
        
        // Show custom alert for ending session
        
        self.activitySessionViewControllerDelegate?.dismissToActivity()
        self.viewModel?.update(routing: .dismiss)
    }
    
    @objc func checkButtonTapped() {
        // Save the session
        
        // Dismiss to Activity
        
        self.activitySessionViewControllerDelegate?.dismissToActivity()
        self.viewModel?.update(routing: .dismiss)
    }
    
    // MARK: - IBMethods
    
    @IBAction func playPauseButtonTapped(_ sender: Any) {
        
        if self.firstTimePlaying {
            // Show Lottie animation and then continue with the flow
            
            self.countdownAnimationView.play(completion: { _ in
                UIView.animate(withDuration: 0.4, animations: {
                    self.countdownAnimationView.alpha = 0.0
                    self.isPlayingState.toggle()
                    self.updatePlayPauseButtonState()
                    self.viewModel?.handleStopwatch(isPlayingState: self.isPlayingState)
                    
                    self.navigationItem.addButtons(barButtonPositionEnum: .right,
                                                   navigationButtons: [(navigationButtonTypeEnum: .checkmark,
                                                                        action: #selector(self.checkButtonTapped),
                                                                        target: self)])
                })
                self.firstTimePlaying = false
                self.stopButton.backgroundColor = .App.mainText
                self.stopButton.isEnabled = true
            })
        } else {
            self.isPlayingState.toggle()
            self.updatePlayPauseButtonState()
            self.viewModel?.handleStopwatch(isPlayingState: self.isPlayingState)
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        // Custom Popover Tooltip
        
        let height: CGFloat = 45
        let popoverMessage = "ActivitySession_stopButtonPopover".getLocalized()
        
        let width = popoverMessage.width(withConstrainedHeight: height, font: .systemFont(ofSize: 10, weight: .regular)) + 25
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        label.text = popoverMessage
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        label.sizeToFit()
        
        self.flowCoordinator?.displayPopover(text: popoverMessage,
                                             sourceView: self.stopButton,
                                             preferedSize: CGSize(width: width, height: height),
                                             injectedView: label)
    }
    
    @objc func stopButtonLongPress() {
        
        // Stop the stopwatches
        // Disable the play button
        
        self.playPauseButton.backgroundColor = .systemGray
        self.playPauseButton.isEnabled = false
        self.viewModel?.stopSession()
    }
}

struct ActivitySession {
    enum RoutingEnum {
        case dismiss
        case save
    }
}
