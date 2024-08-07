//
//  CoreDataHandler+Properties.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation
import CoreData


extension CoreDataHandler {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataHandler> {
        return NSFetchRequest<CoreDataHandler>(entityName: "CoreDataHandler")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var state: String?
    @NSManaged public var country: String?
    @NSManaged public var countryCode: String?
    @NSManaged public var attribute: String?
    @NSManaged public var webPage: URL?
    
    func convertToUniversity() -> University {
        
        return  University(countryCode: self.countryCode, country: self.country, name: self.name, state: self.state, url: self.webPage)
    }

}

extension CoreDataHandler : Identifiable {

}
