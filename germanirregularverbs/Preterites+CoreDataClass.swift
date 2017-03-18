//
//  Preterites+CoreDataClass.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 18/02/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation
import CoreData


public class Preterites: NSManagedObject {
    
    @nonobjc public class func createPreterite(_ preteriteString: String, in managedObjectContext: NSManagedObjectContext) -> Preterites {
        let preterite = NSEntityDescription.insertNewObject(forEntityName: "Preterites", into: managedObjectContext) as! Preterites
        preterite.preterite = preteriteString
        return preterite
    }

}
