//
//  Translations+CoreDataClass.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 18/02/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation
import CoreData


public class Translations: NSManagedObject {
    
    @nonobjc public class func createTranslation(_ translationString: String, in managedObjectContext: NSManagedObjectContext) -> Translations {
        let translation = NSEntityDescription.insertNewObject(forEntityName: "Translations", into: managedObjectContext) as! Translations
        translation.translation = translationString
        return translation
    }

}
