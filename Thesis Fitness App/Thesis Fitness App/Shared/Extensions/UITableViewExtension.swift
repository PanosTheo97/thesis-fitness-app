//
//  UITableViewExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import UIKit

extension UITableView {
    
    // MARK: - Methods
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UIView>() -> T {
        guard let headerView = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("COULD NOT DEQUEUE REUSABLE TABLE VIEW HEADER")
        }
        return headerView
    }
    
    func bindCell(named: String) {
        let nib = UINib(nibName: named, bundle: nil)
        self.register(nib, forCellReuseIdentifier: named+"Identifier")
    }
    
    func bindHeader(named: String) {
        let nibHeader = UINib(nibName: named, bundle: nil)
        self.register(nibHeader, forHeaderFooterViewReuseIdentifier: named+"Identifier")
    }
    
    func addHeader(view: UIView) {
        let size = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        self.tableHeaderView = view
        self.tableHeaderView?.frame.size = size
    }
    
}
