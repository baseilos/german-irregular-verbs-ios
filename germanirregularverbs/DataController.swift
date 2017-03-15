//
//  DataController.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 23/02/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataController: NSObject {
    
    // MARK: Properties
    var managedObjectContext: NSManagedObjectContext

    override init() {
        guard let modelURL = Bundle.main.url(forResource: "VerbModel", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex - 1]
        let storeURL = docURL.appendingPathComponent("VerbsModel.sqlite")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
    }
    
    func loadVerbs() throws -> [Verbs] {
        let fetchRequest: NSFetchRequest<Verbs> = Verbs.fetchRequest()
        return try managedObjectContext.fetch(fetchRequest)
    }
    
    func saveVerb(translations: Set<String>) throws {
        let _ = Verbs.createVerb(translations: getTranslations(translations: translations), into: managedObjectContext)
        try managedObjectContext.save()
    }
    
    private func getTranslations(translations: Set<String>) -> Set<Translations> {
        var translatiionsMOs = Set<Translations>()
        for translation in translations {
            translatiionsMOs.insert(Translations.createTranslation(translationString: translation, in: managedObjectContext))
        }
        return translatiionsMOs
    }
}
