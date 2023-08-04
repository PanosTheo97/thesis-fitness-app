//
//  Stopwatch.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 4/8/23.
//

import Foundation

class Stopwatch {
    
    // MARK: - Properties
    
    private var startTime: Date?
    private var accumulatedTime: TimeInterval = 0
    
    // MARK: - Methods
    
    func start() {
        self.startTime = Date()
    }
    
    func stop() {
        self.accumulatedTime = self.elapsedTime()
        self.startTime = nil
    }
    
    func reset() {
        self.accumulatedTime = 0
        self.startTime = nil
    }
    
    func elapsedTime() -> TimeInterval {
        return -(self.startTime?.timeIntervalSinceNow ?? 0) + self.accumulatedTime
    }
    
    func getTimeString() -> String {
        let hours = Int(self.elapsedTime() / 3600)
        let minutes = Int(self.elapsedTime() / 60) % 60
        let seconds = Int(self.elapsedTime()) % 60
        let fractions = Int((self.elapsedTime().truncatingRemainder(dividingBy: 1)) * 100)
        let timeString = String(format: "%02d:%02d:%02d:%02d", hours, minutes, seconds, fractions)
        return timeString
    }
}
