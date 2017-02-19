//
//  Perfects+CoreDataProperties.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 18/02/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation
import CoreData


extension Perfects {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Perfects> {
        return NSFetchRequest<Perfects>(entityName: "Perfects");
    }

    @NSManaged public var auxverb: String?
    @NSManaged public var perfect: String?

}
