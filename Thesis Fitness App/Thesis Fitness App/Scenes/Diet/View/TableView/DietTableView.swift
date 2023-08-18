//
//  DietTableView.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/8/23.
//

import UIKit

class DietTableView: UITableView {

    // MARK: - Properties

    var data: [DietModel] = []

    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.separatorStyle = .none
        
        self.delegate = self
        self.dataSource = self
        
        self.bindCell(named: "DietTableViewCell")
        
        self.estimatedRowHeight = 200
    }
    
    // MARK: - Methods
    
    func setup(data: [DietModel]) {
        self.data = data
        self.reloadData()
    }

}
