//
//  UICollectionViewExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import UIKit

extension UICollectionView {

    // MARK: - Methods
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Collection View Cell")
        }
        return cell
    }
    
    func bindCell(named: String) {
        let nib = UINib(nibName: named, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: named+"Identifier")
    }
    
    func bindHeader(named: String) {
        let nib = UINib(nibName: named, bundle: nil)
        self.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: named+"Identifier")
    }
    
}
