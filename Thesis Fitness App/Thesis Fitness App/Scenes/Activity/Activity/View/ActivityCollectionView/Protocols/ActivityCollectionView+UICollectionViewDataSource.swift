//
//  ActivityCollectionView+UICollectionViewDataSource.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 26/7/23.
//

import Foundation
import UIKit

extension ActivityCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ActivityCollectionViewCell? = collectionView.dequeueReusableCell(for: indexPath)
        cell?.setup(model: self.data[indexPath.row], isInEditMode: self.isInEditMode)
        return cell ?? UICollectionViewCell()
    }
}
