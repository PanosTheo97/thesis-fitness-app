//
//  RegistrationDIContainer.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation

final class RegistrationDIContainer {
    
    let lobbyModule = LobbyModule()
    
    let welcomeModule = WelcomeModule()
    
    let homeModule = HomeModule()
    let activityModule = ActivityModule()
    let workoutModule = WorkoutModule()
    let dietModule = DietModule()
    let profileModule = ProfileModule()
    
}
