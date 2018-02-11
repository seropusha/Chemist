//
//  RemedyDescription.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

internal struct RemedyDescriptionItem: JSONable {
    
    enum Keys {
        static let id                               = "id"
        static let useDuringPregnancy               = "use-during-pregnancy"
        static let contraindications                = "contraindications"
        static let storageConditions                = "storage-conditions"
        static let indications                      = "indications"
        static let drugInteractions                 = "drug-interactions"
        static let dosing                           = "dosing"
        static let bbd                              = "bbd"
        static let pharmacokinetics                 = "pharmacokinetics"
        static let precautions                      = "precautions"
        static let pharmacologyActionDescription    = "pharmacologyActionDescription"
        static let sideEffects                      = "side-effects"
        static let useInImpairedRenalFunction       = "use-in-impaired-renal-function"
        static let releaseForm                      = "release-form"
        static let specialCases                     = "special-cases"
        static let cautions                         = "cautions"
        static let pharmacodynamics                 = "pharmacodynamics"
        static let drugOverdose                     = "drug-overdose"
    }
    
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
    
    init(_ json: [AnyHashable : Any]) {
        guard let identifier: String = json.value(for: Keys.id) else {
            fatalError("\(RemedyDescriptionItem.self) must have id")
        }
        id = identifier
        bbd = json.value(for: Keys.bbd)
        cautions = json.value(for: Keys.cautions)
        contraindications = json.value(for: Keys.contraindications)
        dosing = json.value(for: Keys.dosing)
        drugInteractions = json.value(for: Keys.drugInteractions)
        drugOverdose = json.value(for: Keys.drugOverdose)
        indications = json.value(for: Keys.indications)
        pharmacodynamics = json.value(for: Keys.pharmacodynamics)
        pharmacokinetics = json.value(for: Keys.pharmacokinetics)
        pharmacologyActionDescription = json.value(for: Keys.pharmacologyActionDescription)
        precautions = json.value(for: Keys.precautions)
        releaseForm = json.value(for: Keys.releaseForm)
        sideEffects = json.value(for: Keys.sideEffects)
        specialCases = json.value(for: Keys.specialCases)
        storageConditions = json.value(for: Keys.storageConditions)
        useDuringPregnancy = json.value(for: Keys.useDuringPregnancy)
        useInImpairedRenalFunction = json.value(for: Keys.useInImpairedRenalFunction)
    }
}
