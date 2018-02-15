//
//  RemedyDescription.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

internal struct RemedyDescriptionItem {
    
    var id: String
    var bbd: String?
    var cautions: String?
    var contraindications: String?
    var dosing: String?
    var drugInteractions: String?
    var drugOverdose: String?
    var indications: String?
    var pharmacodynamics: String?
    var pharmacokinetics: String?
    var pharmacologyActionDescription: String?
    var precautions: String?
    var releaseForm: String?
    var sideEffects: String?
    var specialCases: String?
    var storageConditions: String?
    var useDuringPregnancy: String?
    var useInImpairedRenalFunction: String?
}

extension RemedyDescriptionItem: Decodable {
    
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
    
    public init(from decoder: Decoder) throws {
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
    }
}
