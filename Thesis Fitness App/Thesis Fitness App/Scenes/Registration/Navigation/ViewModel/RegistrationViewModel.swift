//
//  RegistrationViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation

class RegistrationViewModel: BaseViewModelProtocol {
    
    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    
    var user = UserModel(name: AccountManager.shared.user?.displayName ?? "user".getLocalized(),
                         bodyweight: "0.0",
                         favoriteActivities: [])
    
    // MARK: - Life cycle
    
    init() {
        
    }
    
    func setUserName(name: String) {
        self.user.name = name
    }
    
    func setUserBodyComposition(bodyweight: String, musclePercentage: String?, fatPercentage: String?) {
        self.user.bodyweight = bodyweight
        self.user.musclePercentage = musclePercentage
        self.user.fatPercentage = fatPercentage
    }
    
    func setUserActivityGoals(dailyStepGoal: Int?, dailyCalorieBurnGoal: Int?) {
        self.user.dailyStepGoal = dailyStepGoal
        self.user.dailyCalorieBurnGoal = dailyCalorieBurnGoal
    }
    
    func setUserFavoriteActivities(favoriteActivities: [ActivityEnum]) {
        self.user.favoriteActivities = favoriteActivities
    }
    
    func setUserDietGoals(calorieGoal: String?, proteinGoal: String?, carbGoal: String?, fatsGoal: String?, waterGoal: String?) {
        self.user.calorieGoal = calorieGoal
        self.user.proteinGoal = proteinGoal
        self.user.carbGoal = carbGoal
        self.user.fatsGoal = fatsGoal
        self.user.waterGoal = waterGoal
    }
    
}
