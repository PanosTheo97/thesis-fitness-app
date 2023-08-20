//
//  ActivityCollectionView.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 26/7/23.
//

import UIKit

struct ActivityCollectionViewModel {
    
    // MARK: - Properties
    
    var type: ActivityEnum
    var isFavorite: Bool
    
    // MARK: - LifeCycle
    
    init(type: ActivityEnum, isFavorite: Bool) {
        self.type = type
        self.isFavorite = isFavorite
    }
}

protocol ActivityCollectionViewProtocol: AnyObject {
    func activityTapped(activityId: String)
}

class ActivityCollectionView: UICollectionView {

    // MARK: - Properties

    var data: [ActivityCollectionViewModel] = []

    weak var activityCollectionViewDelegate: ActivityCollectionViewProtocol?
    
    var isInEditMode: Bool = false

    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear

        self.dataSource = self
        self.delegate = self
        
        self.bindCell(named: "ActivityCollectionViewCell")

    }
    
    // MARK: - Methods
    
    func setup(data: [ActivityCollectionViewModel]) {
        self.data = data
        self.reloadData()
    }

}
