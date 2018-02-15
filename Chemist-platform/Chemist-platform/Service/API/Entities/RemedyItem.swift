//
//  Remedy.swift
//  Chemist-platform
//
//  Created by Sergey Navka on 2/7/18.
//  Copyright © 2018 Navka Sergey. All rights reserved.
//

import Foundation

internal struct RemedyItem {

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
}

extension RemedyItem: Decodable {
    
    private enum RemedyKeys: String, CodingKey {
        case id           = "id"
        case title        = "title"
        case titleFull    = "title_big"
        case substance    = "substance"
        case manufactured = "manufactured"
        case type         = "class"
        case farmType     = "farm_utics_action_short"
        case farmGroup    = "farm_group"
        case description  = "description"
        case jenericIDs   = "jeneric_id"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RemedyKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        titleFull = try container.decode(String.self, forKey: .titleFull)
        substance = try container.decode(String.self, forKey: .substance)
        manufactured = try container.decode(String.self, forKey: .manufactured)
        type = try container.decode(String.self, forKey: .type)
        farmType = try container.decode(String.self, forKey: .farmType)
        farmGroup = try container.decode(String.self, forKey: .farmGroup)
        description = try container.decode(RemedyDescriptionItem?.self, forKey: .description)
        jenericIDs = try container.decode(String.self, forKey: .jenericIDs)
    }
}
