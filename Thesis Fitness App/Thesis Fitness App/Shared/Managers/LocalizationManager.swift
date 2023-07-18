//
//  LocalizationManager.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import Foundation
protocol LocalizationManagerProtocol {
    
    // MARK: - Properties
    
    var bundle: Bundle? { get }
    
    // MARK: - Methods
    
    func getLocale() -> Locale
    func getLanguage() -> LanguageEnum
    func getHeadlessLanguage() -> String
    func getAutomatedLanguage() -> String
}

class LocalizationManager: LocalizationManagerProtocol {
    
    // MARK: - Properties
    
    var bundle: Bundle? {
        guard let path = Bundle.main.path(forResource: getLanguage().rawValue, ofType: "lproj") else {
            return nil
        }
        return Bundle(path: path)
    }
    
    // MARK: - Methods

    func getLocale() -> Locale {
        switch getLanguage() {
        case .english:
            return Locale(identifier: "en_En")
        default:
            return Locale(identifier: "el_GR")
        }
    }
    
    func getLanguage() -> LanguageEnum {
        
        guard let selectedLanguageString = appViewModel.defaultsManagerProtocol.getLanguage(),
              let selectedLanguage = LanguageEnum(rawValue: selectedLanguageString) else {
            if let currentLanguageStringID = Locale.preferredLanguages.first {
                if currentLanguageStringID.range(of: LanguageEnum.greek.rawValue) != nil {
                    return .greek
                }
            }
            return .english
        }
        return selectedLanguage
    }
    
    func getHeadlessLanguage() -> String {
        switch getLanguage() {
        case .english:
            return "en"
        case .greek:
            return "gr"
        }
    }
    
    func getAutomatedLanguage() -> String {
        switch getLanguage() {
        case .english:
            return "en_GB"
        case .greek:
            return "el_GR"
        }
    }

}
