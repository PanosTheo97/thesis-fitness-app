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
        })
    }
    
}

struct ActivitySession {
    enum RoutingEnum {
        case dismiss
        case save
    }
}
