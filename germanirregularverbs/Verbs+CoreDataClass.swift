//
//  Verbs+CoreDataClass.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 18/02/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation
import CoreData


public class Verbs: NSManagedObject {
    
    @nonobjc public class func createVerb(translations: Set<Translations>, into: NSManagedObjectContext) -> Verbs {
        let verb = NSEntityDescription.insertNewObject(forEntityName: "Verbs", into: into) as! Verbs
        for translation in translations {
            verb.addToTranslations(translation)
        }
        return verb
    }

}
