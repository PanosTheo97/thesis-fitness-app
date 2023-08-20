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
            activityLabel.font = .systemFont(ofSize: 12, weight: .bold)
            activityLabel.textColor = .label
        }
    }
    
    // MARK: - Properties
    
    var marchingAnts: CAShapeLayer?
    
    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.backgroundColor = .App.mainText
    }
    
    // MARK: - Methods

    func setup(model: ActivityCollectionViewModel, isInEditMode: Bool) {
        self.activityImageView.image = model.type.getImage()
        self.activityLabel.text = model.type.getName()
        self.favoriteImageView.isHidden = !model.isFavorite
        
        if isInEditMode {
            self.addMarchingAnts()
        } else {
            self.marchingAnts?.removeFromSuperlayer()
        }
        
    }
    
    func addMarchingAnts() {
        self.marchingAnts?.removeFromSuperlayer()
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 12).cgPath
        layer.strokeColor = UIColor.systemYellow.cgColor
        layer.lineWidth = 4
        layer.fillColor = nil
        layer.lineDashPattern = [8, 6]
        self.layer.addSublayer(layer)
        self.marchingAnts = layer
        
        let animation = CABasicAnimation(keyPath: "lineDashPhase")
        animation.fromValue = 0
        animation.toValue = self.marchingAnts?.lineDashPattern?.reduce(0) { $0 - $1.intValue } ?? 0
        animation.duration = 1
        animation.repeatCount = .infinity
        self.marchingAnts?.add(animation, forKey: "line")
    }

}
