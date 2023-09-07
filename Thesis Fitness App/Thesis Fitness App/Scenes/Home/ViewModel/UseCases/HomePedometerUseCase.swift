//
//  HomePedometerUseCase.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/8/23.
//

import Foundation
import CoreMotion

protocol HomePedometerUseCaseProtocol: AnyObject {
    func execute(completion: @escaping (Int) -> Void)
}

class HomePedometerUseCase: HomePedometerUseCaseProtocol {
    
    func execute(completion: @escaping (Int) -> Void) {
        /// Provides to create an instance of the CMMotionActivityManager.
        //let activityManager = CMMotionActivityManager()
        /// Provides to create an instance of the CMPedometer.
        let pedometer = CMPedometer()
        
//        activityManager.startActivityUpdates(to: OperationQueue.main) { (activity: CMMotionActivity?) in
//            guard let activity = activity else { return }
//            DispatchQueue.main.async {
//                if activity.stationary {
//                    print("Stationary")
//                } else if activity.walking {
//                    print("Walking")
//                } else if activity.running {
//                    print("Running")
//                } else if activity.automotive {
//                    print("Automotive")
//                }
//            }
//        }
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date()) { pedometerData, error in
                guard let pedometerData = pedometerData, error == nil else { return }
                DispatchQueue.main.async {
                    completion(pedometerData.numberOfSteps.intValue)
                }
            }
        }
    }
}
