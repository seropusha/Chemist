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
public class RemedyDescriptionEntity: NSManagedObject {

    func populate(_ item: RemedyDescriptionItem) {
        bbd = item.bbd
        cautions = item.cautions
        contraindications = item.contraindications
        dosing = item.dosing
        drugInteractions = item.drugInteractions
        drugOverdose = item.drugOverdose
        indications = item.indications
        pharmacodynamics = item.pharmacodynamics
        pharmacokinetics = item.pharmacokinetics
        pharmacologyActionDescription = item.pharmacologyActionDescription
        precautions = item.precautions
        releaseForm = item.releaseForm
        sideEffects = item.sideEffects
        specialCases = item.specialCases
        storageConditions = item.storageConditions
        useDuringPregnancy = item.useDuringPregnancy
        useInImpairedRenalFunction = item.useInImpairedRenalFunction

//        parent = ??
    }
    
}
