//
//  RemedyDescriptionEntity+CoreDataProperties.swift
//  
//
//  Created by Sergey Navka on 2/6/18.
//
//

import Foundation
import CoreData


extension RemedyDescriptionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RemedyDescriptionEntity> {
        return NSFetchRequest<RemedyDescriptionEntity>(entityName: "RemedyDescriptionEntity")
    }

    @NSManaged public var id: String
    @NSManaged public var bbd: String?
    @NSManaged public var cautions: String?
    @NSManaged public var contraindications: String?
    @NSManaged public var dosing: String?
    @NSManaged public var drugInteractions: String?
    @NSManaged public var drugOverdose: String?
    @NSManaged public var indications: String?
    @NSManaged public var pharmacodynamics: String?
    @NSManaged public var pharmacokinetics: String?
    @NSManaged public var pharmacologyActionDescription: String?
    @NSManaged public var precautions: String?
    @NSManaged public var releaseForm: String?
    @NSManaged public var sideEffects: String?
    @NSManaged public var specialCases: String?
    @NSManaged public var storageConditions: String?
    @NSManaged public var useDuringPregnancy: String?
    @NSManaged public var useInImpairedRenalFunction: String?
    @NSManaged public var parent: RemedyEntity?

}
