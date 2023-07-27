//
//  ActivityCollectionViewCell.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 26/7/23.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBProperties
    
    @IBOutlet weak var activityImageView: UIImageView! {
        didSet {
            activityImageView.contentMode = .scaleAspectFit
            activityImageView.tintColor = .label
        }
    }
    @IBOutlet weak var favoriteImageView: UIImageView! {
        didSet {
            favoriteImageView.contentMode = .scaleAspectFit
            favoriteImageView.image = .init(systemName: "star.circle")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
            favoriteImageView.isHidden = true
        }
    }
    @IBOutlet weak var activityLabel: UILabel! {
        didSet {
            activityLabel.font = .systemFont(ofSize: 12, weight: .regular)
            activityLabel.textColor = .label
        }
    }
    
    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.backgroundColor = .App.mainText
    }
    
    // MARK: - Methods

    func setup(model: ActivityCollectionViewModel) {
        self.activityImageView.image = model.activityImage
        self.activityLabel.text = model.activityName
        self.favoriteImageView.isHidden = !model.isFavorite
    }

}
