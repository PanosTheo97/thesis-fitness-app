//
//  ActivityEnum.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation
import UIKit

enum ActivityEnum: CaseIterable {
    case running
    case climbing
    case cycling
    case indoorRunning
    case walking
    case jumpingRope
    case boxing
    case pingPong
    
    // MARK: - Methods
    
    func getImage() -> UIImage? {
        switch self {
        case .running:
            return .init(systemName: "figure.run")
        case .climbing:
            return .init(systemName: "figure.climbing")
        case .cycling:
            return .init(systemName: "figure.outdoor.cycle")
        case .indoorRunning:
            return .init(systemName: "figure.indoor.cycle")
        case .walking:
            return .init(systemName: "figure.walk")
        case .jumpingRope:
            return .init(systemName: "figure.jumprope")
        case .boxing:
            return .init(systemName: "figure.boxing")
        case .pingPong:
            return .init(systemName: "figure.table.tennis")
        }
    }
    
    func getName() -> String {
        switch self {
        case .running:
            return "Activity_running".getLocalized()
        case .climbing:
            return "Activity_climbing".getLocalized()
        case .cycling:
            return "Activity_cycling".getLocalized()
        case .indoorRunning:
            return "Activity_indoorRunning".getLocalized()
        case .walking:
            return "Activity_walking".getLocalized()
        case .jumpingRope:
            return "Activity_jumpingRope".getLocalized()
        case .boxing:
            return "Activity_boxing".getLocalized()
        case .pingPong:
            return "Activity_pingPong".getLocalized()
        }
    }
}
