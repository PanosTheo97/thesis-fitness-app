//
//  ActivityEnum.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation
import UIKit

enum ActivityEnum: String, CaseIterable {
    case running = "Runing"
    case climbing = "Climbing"
    case cycling = "Cycling"
    case indoorRunning = "Indoor Running"
    case walking = "Walking"
    case jumpingRope = "Jumping Rope"
    case boxing = "Boxing"
    case pingPong = "Ping Pong"
    
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
    
    func getActivityId() -> String {
        switch self {
        case .running:
            return "YjBbZzm1SjahJnFryDjN"
        case .climbing:
            return "rOGkpF0m5WxCxWOhwQg9"
        case .cycling:
            return "khuM7tOiXxq3GAzd6vG7"
        case .indoorRunning:
            return "DeycT4SHRC7oXICdz8Eu"
        case .walking:
            return "GQwtuStM2lK3K9HPPbuL"
        case .jumpingRope:
            return "hT4SiXXhJNLTZcLh2Ftw"
        case .boxing:
            return "nbLxd82u7iq0vGxzFsf5"
        case .pingPong:
            return "B7i1ymOBSpyug4JpVCUY"
        }
    }
}

extension ActivityEnum {
    init?(string: String) {
        switch string {
        case "YjBbZzm1SjahJnFryDjN":
            self.init(rawValue: "Runing")
        case "rOGkpF0m5WxCxWOhwQg9":
            self.init(rawValue: "Climbing")
        case "khuM7tOiXxq3GAzd6vG7":
            self.init(rawValue: "Cycling")
        case "DeycT4SHRC7oXICdz8Eu":
            self.init(rawValue: "Indoor Running")
        case "GQwtuStM2lK3K9HPPbuL":
            self.init(rawValue: "Walking")
        case "hT4SiXXhJNLTZcLh2Ftw":
            self.init(rawValue: "Jumping Rope")
        case "nbLxd82u7iq0vGxzFsf5":
            self.init(rawValue: "Boxing")
        case "B7i1ymOBSpyug4JpVCUY":
            self.init(rawValue: "Ping Pong")
        default:
            self.init(rawValue: "Runing")
        }
    }
}
