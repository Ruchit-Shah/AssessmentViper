//
//  PersistentDataStorage.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

import CoreData

final class PersistentDataStorage {
    
    private init() {}
    
    // MARK: - Core Data stack
    static let shared = PersistentDataStorage()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AssessmentViper")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

   lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        
        do {
            guard let result = try PersistentDataStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else { return nil }
            return result
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    func saveUniversities(_ universities: [University]) {
            universities.forEach { university in
                let coredataUniversity = CoreDataHandler(context: context) // Assuming UniversityEntity is the
                coredataUniversity.name = university.name
                coredataUniversity.country = university.country
                coredataUniversity.countryCode = university.countryCode
                coredataUniversity.state = university.state
                coredataUniversity.webPage = university.url
            }
            
            saveContext()
        }
    
}
