//
//  MappableExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import ObjectMapper

extension Mappable {
    init?(document: [String: Any]) {
        self.init(JSON: document)
    }
}
