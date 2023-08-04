//
//  ActivitySessionViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 2/8/23.
//

import Foundation

class ActivitySessionViewModel: BaseViewModelProtocol {
    
    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    var routingEnum = Observable<ActivitySession.RoutingEnum?>(value: nil)
    
    var timeString = Observable<String?>(value: nil)
    var breakTimeString = Observable<String?>(value: nil)
    
    var mainStopwatch = Stopwatch()
    var breakStopwatch = Stopwatch()
    
    var mainTimer = Timer()
    var breakTimer = Timer()
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    
    init() {
    }
    
    // MARK: - Methods
    
    func update(routing: ActivitySession.RoutingEnum) {
        self.routingEnum.value = routing
    }
    
    func handleStopwatch(isPlayingState: Bool) {
        if isPlayingState {
            self.mainStopwatch.start()
            self.breakStopwatch.stop()
            
            self.mainTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
                let timeString = self?.mainStopwatch.getTimeString() ?? ""
                self?.timeString.value = timeString
            }
        } else {
            self.breakStopwatch.start()
            self.mainStopwatch.stop()
            
            self.breakTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
                let timeString = self?.breakStopwatch.getTimeString() ?? ""
                self?.breakTimeString.value = timeString
            }
        }
    }
}
