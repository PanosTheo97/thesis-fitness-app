//
//  ActivityCollectionView.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 26/7/23.
//

import UIKit

struct ActivityCollectionViewModel {
    
    // MARK: - Properties
    
    var activityImage: UIImage?
    var activityName: String
    var isFavorite: Bool
    
    // MARK: - LifeCycle
    
    init(activityImage: UIImage?, activityName: String, isFavorite: Bool) {
        self.activityImage = activityImage
        self.activityName = activityName
        self.isFavorite = isFavorite
    }
}

protocol ActivityCollectionViewProtocol: AnyObject {
    func activityTapped()
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
