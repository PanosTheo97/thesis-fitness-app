//
//  DietTableViewCell.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/8/23.
//

import UIKit

class DietTableViewCell: UITableViewCell {
    
    // MARK: - IBProperties
    
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
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        }
    }
    
    // MARK: - Properties
    
    var currentValue: Int = 0
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundShadowView.dropShadow(offset: CGSize(width: 0, height: 5), radius: 2, color: .lightGray)
    }
    
    // MARK: - Methods
    
    func setup(model: DietModel) {
        self.titleLabel.textColor = model.macroTypeEnum.getColor()
        self.titleLabel.text = model.macroTypeEnum.getLocalizedTitle()
        self.customCircleView.configure(circleViewTypeEnum: .half,
                                        macroTypeEnum: model.macroTypeEnum,
                                        maxQuantity: model.maxQuantity,
                                        consumedQuantity: model.consumedQuantity)
        self.currentValue = model.consumedQuantity
        
        self.layoutIfNeeded()
    }
}
