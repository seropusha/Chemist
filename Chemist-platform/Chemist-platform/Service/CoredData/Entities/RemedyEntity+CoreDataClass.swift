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
public class RemedyEntity: NSManagedObject {
    
    func populate(_ item: RemedyItem) {
        id = item.id
        farmGroup = item.farmGroup
        farmType = item.farmType
        jenericIDs = item.jenericIDs
        manufactured = item.manufactured
        substance = item.substance
        title = item.title
        titleFull = item.titleFull
        type = item.type

        if let descriptionItem = item.info,
            let currentContext = managedObjectContext {
            currentContext.addEntity(withType: RemedyDescriptionEntity.self)
                .skipNil()
                .startWithResult { [unowned self] result in
                    if case let .success(descriptionEntity) = result {
                        descriptionEntity.populate(descriptionItem)
                        self.info = descriptionEntity
                    }
            }
        }
    }
    
}
