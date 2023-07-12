//
//  RefreshableTableView.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import UIKit

class RefreshableTableView: UITableView {

    // MARK: - METHODS 🌐 PUBLIC

    override func awakeFromNib() {
        super.awakeFromNib()
        
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .white
        refreshControl?.addTarget(target, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        didRefreshTrigger()
        refreshControl.endRefreshing()
            
    }
    
    func didRefreshTrigger() {
        // ✔️ NONE
    }

}
