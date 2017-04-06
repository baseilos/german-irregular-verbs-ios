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
    private var managedObjectContext: NSManagedObjectContext

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
    
    func clearAllVerbs() throws {
        try managedObjectContext.execute(Verbs.deleteRequest())
    }
    
    func saveVerb(isActive: Bool, present: String, translations: Set<String>, preterites: Set<String>, perfects: Set<Perfects.PerfectHolder>) throws {
        let _ = Verbs.createVerb(isActive: isActive, present: present, translations: getTranslations(translations), perfects: getPerfects(perfects), preterites: getPreterites(preterites), into: managedObjectContext)
        try managedObjectContext.save()
    }
    
    private func getTranslations(_ translations: Set<String>) -> Set<Translations> {
        var translatiionsMOs = Set<Translations>()
        for translation in translations {
            translatiionsMOs.insert(Translations.createTranslation(translation, in: managedObjectContext))
        }
        return translatiionsMOs
    }
    
    private func getPreterites(_ preterites: Set<String>) -> Set<Preterites> {
        var preteritesMOs = Set<Preterites>()
        for preterite in preterites {
            preteritesMOs.insert(Preterites.createPreterite(preterite, in: managedObjectContext))
        }
        return preteritesMOs
    }
    
    private func getPerfects(_ perfects: Set<Perfects.PerfectHolder>) -> Set<Perfects> {
        var perfectsMOs = Set<Perfects>()
        for perfect in perfects {
            perfectsMOs.insert(Perfects.createPerfect(perfect, in: managedObjectContext))
        }
        return perfectsMOs
    }
}
