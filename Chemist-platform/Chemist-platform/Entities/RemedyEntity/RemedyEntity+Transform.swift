//
//  RemedyEntity+Transform.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/25/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Chemist_domain

extension RemedyEntity {
    func toRemedy() -> Remedy {
        let remedy = Remedy(id: id,
                            farmGroup: farmGroup,
                            farmType: farmType,
                            jenericIDs: jenericIDs,
                            manufactured: manufactured,
                            substance: substance,
                            title: title,
                            titleFull: titleFull,
                            type: type,
                            description: nil)
        return remedy
    }
}

extension Sequence where Iterator.Element : RemedyEntity {
    func toRemedies() -> [Remedy] {
        return flatMap({ $0.toRemedy() })
    }
}
