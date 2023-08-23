//
//  NetworkManager.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 23/8/23.
//

import Foundation
import FirebaseFirestore
import ObjectMapper
import Alamofire

enum CollectionTypeEnum: String {
    case users
}

final class NetworkManager {
    
    // MARK: - Methods
    
    static func getDocument<ResponseType: Mappable>(_ responseType: ResponseType.Type, _ collection: CollectionTypeEnum, _ documentId: String, completion: @escaping (Result<ResponseType, Error>) -> Void) {
        let db = Firestore.firestore()
        
        db.collection(collection.rawValue).document(documentId).getDocument { (document, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                if let document = document, document.exists, let data = document.data() {
                    guard let response = ResponseType.init(document: data) else {
                        return
                    }
                    completion(.success(response))
                }
            }
        }
    }
    
    static func getDocuments<ResponseType: Mappable>(_ responseType: ResponseType.Type, _ collection: CollectionTypeEnum, completion: @escaping (Result<[ResponseType], Error>) -> Void) {
        let db = Firestore.firestore()
        
        db.collection(collection.rawValue).getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                var data: [ResponseType] = []
                guard let documents = querySnapshot?.documents else {
                    return
                }
                documents.forEach { document in
                    if let object = ResponseType.init(document: document.data()) {
                        data.append(object)
                    }
                }
                completion(.success(data))
            }
        }
    }
    
    static func addDocument<DocumentType: Mappable>(_ document: DocumentType, _ collection: CollectionTypeEnum, completion: @escaping (Result<DocumentReference?, Error>) -> Void) {
        let db = Firestore.firestore()
        var ref: DocumentReference?
        
        ref = db.collection(collection.rawValue).addDocument(data: document.toJSON()) { err in
            if let error = err {
                completion(.failure(error))
            } else {
                completion(.success(ref))
            }
        }
    }
}
