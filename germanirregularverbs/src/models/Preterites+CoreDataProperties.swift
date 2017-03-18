//
//  Preterites+CoreDataProperties.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 18/02/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation
import CoreData


extension Preterites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Preterites> {
        return NSFetchRequest<Preterites>(entityName: "Preterites");
    }

    @NSManaged public var preterite: String?

}
