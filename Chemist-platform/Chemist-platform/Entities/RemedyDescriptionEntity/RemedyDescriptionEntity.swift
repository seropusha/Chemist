//
//  RemedyDescriptionEntity.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/25/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Chemist_domain

extension RemedyDescriptionEntity {
    func toRemedyDescription() -> RemedyDescription {
        let description = RemedyDescription(id: id,
                                            bbd: bbd,
                                            cautions: cautions,
                                            contraindications: contraindications,
                                            dosing: dosing,
                                            drugInteractions: drugInteractions,
                                            drugOverdose: drugOverdose,
                                            indications: indications,
                                            pharmacodynamics: pharmacodynamics,
                                            pharmacokinetics: pharmacokinetics,
                                            pharmacologyActionDescription: pharmacologyActionDescription,
                                            precautions: precautions,
                                            releaseForm: releaseForm,
                                            sideEffects: sideEffects,
                                            specialCases: specialCases,
                                            storageConditions: storageConditions,
                                            useDuringPregnancy: useDuringPregnancy,
                                            useInImpairedRenalFunction: useInImpairedRenalFunction)
        return description
    }
}
