//
//  RemedyEntity+CoreDataProperties.swift
//  
//
//  Created by Sergey Navka on 2/6/18.
//
//

import Foundation
import CoreData


extension RemedyEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RemedyEntity> {
        return NSFetchRequest<RemedyEntity>(entityName: "RemedyEntity")
    }

    @NSManaged public var farmGroup: String
    @NSManaged public var farmType: String
    @NSManaged public var id: String
    @NSManaged public var jenericIDs: String?
    @NSManaged public var manufactured: String
    @NSManaged public var substance: String
    @NSManaged public var title: String
    @NSManaged public var titleFull: String
    @NSManaged public var type: String
    @NSManaged public var info: RemedyDescriptionEntity?

}
