//
//  RemedyDescriptionEntity+CoreDataClass.swift
//  
//
//  Created by Sergey Navka on 2/6/18.
//
//

import Foundation
import CoreData

@objc(RemedyDescriptionEntity)
public class RemedyDescriptionEntity: NSManagedObject, Decodable {
    
    enum RemedyDescriptionKeys: String, CodingKey {
        case id                               = "id"
        case useDuringPregnancy               = "use-during-pregnancy"
        case contraindications                = "contraindications"
        case storageConditions                = "storage-conditions"
        case indications                      = "indications"
        case drugInteractions                 = "drug-interactions"
        case dosing                           = "dosing"
        case bbd                              = "bbd"
        case pharmacokinetics                 = "pharmacokinetics"
        case precautions                      = "precautions"
        case pharmacologyActionDescription    = "pharmacologyActionDescription"
        case sideEffects                      = "side-effects"
        case useInImpairedRenalFunction       = "use-in-impaired-renal-function"
        case releaseForm                      = "release-form"
        case specialCases                     = "special-cases"
        case cautions                         = "cautions"
        case pharmacodynamics                 = "pharmacodynamics"
        case drugOverdose                     = "drug-overdose"
    }
    
    public convenience required init(from decoder: Decoder) throws {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "\(type(of: self))", in: decoder.managedContext) else {
            fatalError("NSEntityDescription not found")
        }
        self.init(entity: entityDescription, insertInto: decoder.managedContext)
        
        let container = try decoder.container(keyedBy: RemedyDescriptionKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        useDuringPregnancy = try container.decode(String?.self, forKey: .useDuringPregnancy)
        contraindications = try container.decode(String?.self, forKey: .contraindications)
        storageConditions = try container.decode(String?.self, forKey: .storageConditions)
        indications = try container.decode(String?.self, forKey: .indications)
        drugInteractions = try container.decode(String?.self, forKey: .drugInteractions)
        dosing = try container.decode(String?.self, forKey: .dosing)
        bbd = try container.decode(String?.self, forKey: .bbd)
        pharmacokinetics = try container.decode(String?.self, forKey: .pharmacokinetics)
        precautions = try container.decode(String?.self, forKey: .precautions)
        pharmacologyActionDescription = try container.decode(String?.self, forKey: .pharmacologyActionDescription)
        sideEffects = try container.decode(String?.self, forKey: .sideEffects)
        useInImpairedRenalFunction = try container.decode(String?.self, forKey: .useInImpairedRenalFunction)
        releaseForm = try container.decode(String?.self, forKey: .releaseForm)
        specialCases = try container.decode(String?.self, forKey: .specialCases)
        cautions = try container.decode(String?.self, forKey: .cautions)
        pharmacodynamics = try container.decode(String?.self, forKey: .pharmacodynamics)
        drugOverdose = try container.decode(String?.self, forKey: .drugOverdose)
        
        decoder.managedContext.reactive.fetch(withType: RemedyEntity.self, predicate: NSPredicate(format: "id == %@", id))
            .take(last: 1)
            .startWithResult({ [weak self] result in
                if case let .success(remedies) = result {
                    self?.parent = remedies.first
                }
            })

    }
}
