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
    
    @nonobjc public class func deleteRequest() -> NSBatchDeleteRequest {
        return NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Verbs"));
    }
    
    @nonobjc public class func createVerb(isActive: Bool, present: String, translations: Set<Translations>, perfects: Set<Perfects>, preterites: Set<Preterites>, into: NSManagedObjectContext) -> Verbs {
        let verb = NSEntityDescription.insertNewObject(forEntityName: "Verbs", into: into) as! Verbs
        verb.present = present
        verb.active = isActive
        for translation in translations {
            verb.addToTranslations(translation)
        }
        for perfect in perfects {
            verb.addToPerfects(perfect)
        }
        for preterite in preterites {
            verb.addToPreterites(preterite)
        }
        return verb
    }

}
