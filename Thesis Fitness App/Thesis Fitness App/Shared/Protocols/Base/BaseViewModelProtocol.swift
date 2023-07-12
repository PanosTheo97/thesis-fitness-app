//
//  BaseViewModelProtocol.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
protocol BaseViewModelProtocol {
    var isLoading: Observable<Bool?> { get set }
}
