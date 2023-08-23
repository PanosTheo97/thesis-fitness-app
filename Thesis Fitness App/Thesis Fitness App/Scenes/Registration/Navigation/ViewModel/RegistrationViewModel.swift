//
//  RegistrationViewModel.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 20/8/23.
//

import Foundation
import FirebaseFirestore

class RegistrationViewModel: BaseViewModelProtocol {
    
    // MARK: - Observables
    
    var isLoading = Observable<Bool?>(value: nil)
    
    var user = FUserModel(name: AccountManager.shared.user?.displayName,
                          email: AccountManager.shared.user?.email)
    
    // MARK: - Properties
    
    var registrationAddUserUseCase: RegistrationAddUserUseCaseProtocol
    
    // MARK: - Life cycle
    
    init(registrationAddUserUseCase: RegistrationAddUserUseCaseProtocol) {
        self.registrationAddUserUseCase = registrationAddUserUseCase
    }
    
    // MARK: - Merthods
    
    func executeRegistrationAddUserUseCase(completion: @escaping (Bool) -> Void) {
        self.isLoading.value = true
        self.registrationAddUserUseCase.execute(user: self.user) { documentId in
            self.isLoading.value = false
            guard let documentId = documentId else {
                completion(false)
                return
            }
            AccountManager.shared.userDocimentId = documentId
            completion(true)
        }
    }
    
    func setUserName(name: String) {
        self.user.name = name
    }
    
    func setUserBodyComposition(bodyweight: String, musclePercentage: String?, fatPercentage: String?) {
        self.user.bodyweight = Double(bodyweight)
        if let musclePercentage = musclePercentage { self.user.muscleMassPercentage = Double(musclePercentage) }
        if let fatPercentage = fatPercentage { self.user.bodyFatPercentage = Double(fatPercentage) }
        
    }
    
    func setUserActivityGoals(dailyStepGoal: Int?, dailyCalorieBurnGoal: Int?) {
        if let dailyStepGoal = dailyStepGoal { self.user.dailyStepsGoal = Int(dailyStepGoal) }
        if let dailyCalorieBurnGoal = dailyCalorieBurnGoal { self.user.dailyCaloricBurnGoal = Int(dailyCalorieBurnGoal) }
    }
    
    func setUserFavoriteActivities(favoriteActivities: [ActivityEnum]) {
        var favoriteActivitiesIds: [String] = []
        favoriteActivities.forEach { activity in
            favoriteActivitiesIds.append(activity.getActivityId())
        }
        self.user.favoriteActivitiesID = favoriteActivitiesIds
    }
    
    func setUserDietGoals(calorieGoal: String, proteinGoal: String, carbGoal: String, fatsGoal: String, waterGoal: String) {
        let calories: Double? = Double(calorieGoal) == 0 ? Double(calorieGoal) : nil
        let protein: Double? = Double(calorieGoal) == 0 ? Double(calorieGoal) : nil
        let carbs: Double? = Double(calorieGoal) == 0 ? Double(calorieGoal) : nil
        let fats: Double? = Double(calorieGoal) == 0 ? Double(calorieGoal) : nil
        let water: Double? = Double(calorieGoal) == 0 ? Double(calorieGoal) : nil
        
        self.user.dietGoal = FDietModel(calories: calories,
                                        carbohydrates: carbs,
                                        fats: fats,
                                        protein: protein,
                                        water: water)
    }
}
