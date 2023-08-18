//
//  DietViewController.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import UIKit
import Floaty

class DietViewController: UIViewController, BaseProtocol {
    
    // MARK: - IBProperties
    
    @IBOutlet weak var addMetricsFAB: Floaty! {
        didSet {
            addMetricsFAB.buttonColor = .App.mainText
            addMetricsFAB.plusColor = .label
            addMetricsFAB.overlayColor = .systemBackground.withAlphaComponent(0.3)
            addMetricsFAB.openAnimationType = .slideUp
        }
    }
    
    @IBOutlet weak var dietTableView: DietTableView!
    
    // MARK: - Properties
    
    var viewModel: DietViewModel?
    var flowCoordinator: DietFlowCoordinator?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.viewModel?.setup()
    }

    // MARK: - Methods
    
    private func setup() {
        registerObservers()
        
        self.view.backgroundColor = .systemBackground
        self.addNavigationButtons()
        self.configureFAB()
    }
    
    private func registerObservers() {
        
        registerBaseObservers()
        
        viewModel?.routingEnum.addObserver({ [weak self] routingEnum in
            switch routingEnum {
            default: ()
            }
        })
        
        viewModel?.dietData.addObserver({ [weak self] data in
            self?.dietTableView.setup(data: data)
        })
        
    }
    
    func addNavigationButtons() {
        self.navigationItem.addTitle(title: "Lobby_dietTitle".getLocalized())
    }
    
    func configureFAB() {
        let addMacrosItem = FloatyItem()
        addMacrosItem.buttonColor = .App.mainText
        addMacrosItem.title = "Diet_FAB_addMacros".getLocalized()
        addMacrosItem.titleColor = .label
        addMacrosItem.icon = .init(systemName: "atom")
        addMacrosItem.iconTintColor = .label
        addMacrosItem.handler = { _ in
            self.addMetricsFAB.close()
        }
        
        let addFoodItem = FloatyItem()
        addFoodItem.buttonColor = .App.mainText
        addFoodItem.title = "Diet_FAB_addFood".getLocalized()
        addFoodItem.titleColor = .label
        addFoodItem.icon = .init(systemName: "carrot.fill")
        addFoodItem.iconTintColor = .label
        addFoodItem.handler = { _ in
            self.addMetricsFAB.close()
        }
        
        self.addMetricsFAB.addItem(item: addMacrosItem)
        self.addMetricsFAB.addItem(item: addFoodItem)
        
    }
}

struct Diet {
    enum RoutingEnum {
        case test
    }
}
