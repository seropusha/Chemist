//
//  Remedy.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

public struct Remedy {

    var farmGroup: String
    var farmType: String
    var id: String
    var jenericIDs: String?
    var manufactured: String
    var substance: String
    var title: String
    var titleFull: String
    var type: String
    var description: RemedyDescription?
    
    public init(id: String,
                farmGroup: String,
                farmType: String,
                jenericIDs: String?,
                manufactured: String,
                substance: String,
                title: String,
                titleFull: String,
                type: String,
                description: RemedyDescription?) {
    self.farmGroup = farmGroup
    self.farmType = farmType
    self.id = id
    self.jenericIDs = jenericIDs
    self.manufactured = manufactured
    self.substance = substance
    self.title = title
    self.titleFull = titleFull
    self.type = type
    self.description = description
    }

}


