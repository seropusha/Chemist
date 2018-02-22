//
//  RemedyEntity+CoreDataClass.swift
//  
//
//  Created by Sergey Navka on 2/6/18.
//
//

import Foundation
import CoreData

@objc(RemedyEntity)
public class RemedyEntity: NSManagedObject, Decodable {
    
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
    
    public convenience required init(from decoder: Decoder) throws {
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "\(RemedyDescriptionEntity.self)", in: decoder.managedContext) else {
            fatalError("")
        }
        
        self.init(entity: entityDescription, insertInto: decoder.managedContext)
        
        let container = try decoder.container(keyedBy: RemedyKeys.self)

        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        titleFull = try container.decode(String.self, forKey: .titleFull)
        substance = try container.decode(String.self, forKey: .substance)
        manufactured = try container.decode(String.self, forKey: .manufactured)
        type = try container.decode(String.self, forKey: .type)
        farmType = try container.decode(String.self, forKey: .farmType)
        farmGroup = try container.decode(String.self, forKey: .farmGroup)
        info = try container.decode(RemedyDescriptionEntity?.self, forKey: .description)
        jenericIDs = try container.decode(String.self, forKey: .jenericIDs)
    }
}
