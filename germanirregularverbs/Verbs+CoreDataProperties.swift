//
//  Verbs+CoreDataProperties.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 18/02/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation
import CoreData


extension Verbs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Verbs> {
        return NSFetchRequest<Verbs>(entityName: "Verbs");
    }

    @NSManaged public var active: Bool
    @NSManaged public var present: String?
    @NSManaged public var translations: NSSet?
    @NSManaged public var preterites: NSSet?
    @NSManaged public var perfects: NSSet?

}

// MARK: Generated accessors for translations
extension Verbs {

    @objc(addTranslationsObject:)
    @NSManaged public func addToTranslations(_ value: Translations)

    @objc(removeTranslationsObject:)
    @NSManaged public func removeFromTranslations(_ value: Translations)

    @objc(addTranslations:)
    @NSManaged public func addToTranslations(_ values: NSSet)

    @objc(removeTranslations:)
    @NSManaged public func removeFromTranslations(_ values: NSSet)

}

// MARK: Generated accessors for preterites
extension Verbs {

    @objc(addPreteritesObject:)
    @NSManaged public func addToPreterites(_ value: Preterites)

    @objc(removePreteritesObject:)
    @NSManaged public func removeFromPreterites(_ value: Preterites)

    @objc(addPreterites:)
    @NSManaged public func addToPreterites(_ values: NSSet)

    @objc(removePreterites:)
    @NSManaged public func removeFromPreterites(_ values: NSSet)

}

// MARK: Generated accessors for perfects
extension Verbs {

    @objc(addPerfectsObject:)
    @NSManaged public func addToPerfects(_ value: Perfects)

    @objc(removePerfectsObject:)
    @NSManaged public func removeFromPerfects(_ value: Perfects)

    @objc(addPerfects:)
    @NSManaged public func addToPerfects(_ values: NSSet)

    @objc(removePerfects:)
    @NSManaged public func removeFromPerfects(_ values: NSSet)

}
