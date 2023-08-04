//
//  PopoverViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import UIKit

class PopoverViewController: UIViewController, BaseProtocol, PopoverPresentableViewController {
    
    // MARK: - IBProperties
    @IBOutlet weak var nonSafeAreaView: UIView! {
        didSet {
            self.nonSafeAreaView.backgroundColor = .clear
        }
    }
    
    // MARK: - Properties
    
    var viewModel: PopoverViewModelProtocol?
    var flowCoordinator: PopoverFlowCoordinatorProtocol?
    var popoverConfiguration: PopoverConfiguration?

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: - IBMethods

    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        guard let size = self.popoverConfiguration?.popoverDesiredSize else { return }
        self.viewModel?.executeSetupUseCase(size: size)
    }
    
    private func registerObservers() {
        registerBaseObservers()
        
        self.viewModel?.injectedView.addObserver({ [weak self] view in
            guard let self = self else { return }
            view?.addAndExpand(inside: self.nonSafeAreaView)
        })
    }
}

extension PopoverViewController {
    enum RoutingEnum {
        case test
    }
}
