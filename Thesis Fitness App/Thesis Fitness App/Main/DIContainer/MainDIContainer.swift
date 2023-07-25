//
//  MainDIContainer.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 25/7/23.
//

import Foundation

final class MainDIContainer {
    
    let lobbyModule = LobbyModule()
    
    let welcomeModule = WelcomeModule()
    
    let homeModule = HomeModule()
    let activityModule = ActivityModule()
    let workoutModule = WorkoutModule()
    let dietModule = DietModule()
    let profileModule = ProfileModule()
    
}
