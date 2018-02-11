//
//  Remedy.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

internal struct RemedyItem: JSONable {

    enum Keys {
        static let id           = "id"
        static let title        = "title"
        static let titleFull    = "title_big"
        static let substance    = "substance"
        static let manufactured = "manufactured"
        static let type         = "class"
        static let farmType     = "farm_utics_action_short"
        static let farmGroup    = "farm_group"
        static let description  = "description"
        static let jenericIDs   = "jeneric_id"
    }
    
    var farmGroup: String
    var farmType: String
    var id: String
    var jenericIDs: String?
    var manufactured: String
    var substance: String
    var title: String
    var titleFull: String
    var type: String
    var description: RemedyDescriptionItem?
    
    init(_ json: [AnyHashable : Any]) {
        guard let identifier: String = json.value(for: Keys.id) else {
            fatalError("\(RemedyItem.self) must have id")
        }
        id = identifier
        farmType = json.value(for: Keys.farmType) ?? ""
        farmGroup = json.value(for: Keys.farmGroup) ?? ""
        jenericIDs = json.value(for: Keys.jenericIDs)
        manufactured = json.value(for: Keys.manufactured) ?? ""
        substance = json.value(for: Keys.substance) ?? ""
        title = json.value(for: Keys.title) ?? ""
        titleFull = json.value(for: Keys.titleFull) ?? ""
        type = json.value(for: Keys.type) ?? ""
        description = json.value(for: Keys.description)
    }
}
