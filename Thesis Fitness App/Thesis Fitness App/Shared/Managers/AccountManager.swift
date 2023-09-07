//
//  AccountManager.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 24/7/23.
//

import Foundation
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

class AccountManager {
    
    // MARK: - Shared
    
    static let shared = AccountManager()
    
    // MARK: - Properties
    
    var user: User?
    var userDocimentId: String?
    
    // MARK: - Methods
    
    func signIn(completion: @escaping (Bool) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            print("No client ID")
            return
        }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: UIWindow.topMostViewController) { result, error in
            guard error == nil else {
                completion(false)
                return
            }
            
            guard let accessToken = result?.authentication.accessToken, let idToken = result?.authentication.idToken else {
                print("Error getting the idToken or client token")
                completion(false)
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else {
                    completion(false)
                    return
                }
                self.user = result?.user
                completion(true)
            }
        }
    }
    
    func signOut(completion: @escaping (Bool) -> Void) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            completion(false)
        }
        
        self.user = nil
        completion(true)
    }
    
    func checkForSignedInUser(completion: @escaping (Bool) -> Void) {
        if Auth.auth().currentUser != nil {
            self.user = Auth.auth().currentUser
            completion(true)
        } else {
            completion(false)
        }
    }
}
