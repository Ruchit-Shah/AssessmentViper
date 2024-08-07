//
//  LocalDataHandler.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

enum UniversityError: Error {
    
    case notFetchedSuccessfully
    
}
enum LocalError: Error {
    case noDataAvailable
}


class LocalDataHandler: LocalDataManage {
    
  
    private var persistentStore: PersistentDataStorage
    
    init() {
        self.persistentStore = PersistentDataStorage.shared
    }
    
    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void) {
        // Fetch universities from Core Data
        let result = persistentStore.fetchManagedObject(managedObject: CoreDataHandler.self)
        
        var universities: [University] = []
        
        result?.forEach({ (cdUniversity) in
            universities.append(cdUniversity.convertToUniversity())
        })
        if universities.isEmpty {
            completion(.failure(LocalError.noDataAvailable))
        }
        completion(.success(universities))
    }
   
    
    func saveUniversities(_ universities: [University]) {
        persistentStore.saveUniversities(universities)
    }
}
