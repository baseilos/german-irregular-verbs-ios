//
//  Translations+CoreDataProperties.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 18/02/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation
import CoreData


extension Translations {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Translations> {
        return NSFetchRequest<Translations>(entityName: "Translations");
    }

    @NSManaged public var translation: String?

}
