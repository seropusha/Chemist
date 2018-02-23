//
//  RemedyDescription.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

public struct RemedyDescription {
    
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
    
    public init(id: String,
                bbd: String?,
                cautions: String?,
                contraindications: String?,
                dosing: String?,
                drugInteractions: String?,
                drugOverdose: String?,
                indications: String?,
                pharmacodynamics: String?,
                pharmacokinetics: String?,
                pharmacologyActionDescription: String?,
                precautions: String?,
                releaseForm: String?,
                sideEffects: String?,
                specialCases: String?,
                storageConditions: String?,
                useDuringPregnancy: String?,
                useInImpairedRenalFunction: String?) {
         self.id = id
         self.bbd = bbd
         self.cautions = cautions
         self.contraindications = contraindications
         self.dosing = dosing
         self.drugInteractions = drugInteractions
         self.drugOverdose = drugOverdose
         self.indications = indications
         self.pharmacodynamics = pharmacodynamics
         self.pharmacokinetics = pharmacokinetics
         self.pharmacologyActionDescription = pharmacologyActionDescription
         self.precautions = precautions
         self.releaseForm = releaseForm
         self.sideEffects = sideEffects
         self.specialCases = specialCases
         self.storageConditions = storageConditions
         self.useDuringPregnancy = useDuringPregnancy
         self.useInImpairedRenalFunction = useInImpairedRenalFunction
    }
}

