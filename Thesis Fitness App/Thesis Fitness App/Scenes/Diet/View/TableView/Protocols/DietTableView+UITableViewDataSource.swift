//
//  DietTableView+UITableViewDataSource.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/8/23.
//

import UIKit

extension DietTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DietTableViewCell? = tableView.dequeueReusableCell(for: indexPath)
        cell?.setup(model: self.data[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
