//
//  JSONExtension.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 12/7/23.
//

import Foundation
import SwiftyJSON
import ObjectMapper

extension JSON {
    
    func toObject<T: Mappable>(mappableType: T.Type) -> T? {
        if let rawString = self.rawString() {
            return Mapper<T>().map(JSONString: rawString)
        }
        return nil
    }
    
    func toArray<T: Mappable>(mappableType: T.Type) -> [T]? {
        if let rawString = self.rawString() {
            return Mapper<T>().mapArray(JSONString: rawString)
        }
        return nil
    }
    
}
