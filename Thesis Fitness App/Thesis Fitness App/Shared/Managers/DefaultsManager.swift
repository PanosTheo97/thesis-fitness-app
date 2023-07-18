//
//  DefaultsManager.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 18/7/23.
//

import Foundation
import SwiftyUserDefaults

protocol DefaultsManagerProtocol {
    
    func setNew(languageEnum: LanguageEnum)
    func getLanguage() -> String?
}

class DefaultsManager: DefaultsManagerProtocol {
    
    // MARK: - Properties
    // MARK: - Shared
    
    func setNew(languageEnum: LanguageEnum) {
        Defaults[\.selectedLanguageKey] = languageEnum.rawValue
    }
    func getLanguage() -> String? {
        Defaults[\.selectedLanguageKey]
    }
    
    // MARK: - QuickLogin
    
//    func saveCookies(cookiesDictionany: [String: AnyObject]) {
//        Defaults[\.quickLoginCookiesDictionaryKey] = cookiesDictionany
//    }
//    func loadCookies() -> [String: AnyObject] {
//        return Defaults[\.quickLoginCookiesDictionaryKey]
//    }
    
}
