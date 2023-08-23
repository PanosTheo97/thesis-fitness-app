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
    
//    func addUser() {
//        guard let imageUrl = AccountManager.shared.user?.photoURL, let email = AccountManager.shared.user?.email else {
//            return
//        }
//
//        let db = Firestore.firestore()
//        var ref: DocumentReference?
//        let user = FUserModel(name: self.user.name,
//                              email: email,
//                              imgUrl: imageUrl)
//
//        ref = db.collection("users").addDocument(data: user.toJSON()) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
//    }
//
//    func getUser() {
//        let db = Firestore.firestore()
//
//        db.collection("users").document("SCeAr1KLaVDAs8GEOZJt")
//            .getDocument { (document, error) in
//                if let document = document, document.exists, let data = document.data() {
//                    if let user = FUserModel(document: data) {
//                        print(user.email)
//                    }
//                } else {
//                    print("Document does not exist")
//                }
//            }
//    }
}
