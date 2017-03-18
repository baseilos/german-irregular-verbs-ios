//
//  VerbLoader.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 18/03/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation

class VerbLoader {
    
    // MARK: Properties
    private static let VERBS_FILE_PATH = "verbs"
    private static let VERBS_WITH_SEIN_PATH = "verbs-with-sein"
    private static let VERBS_FILE_TYPE = "lst"
    
    private static let VERBS_VALUES_SEPARATOR = "/"
    
    private static let PERFECT_HABEN_AUX_VERB = "hat"
    private static let PERFECT_SIND_AUX_VERB = "ist"
    
    public static func initVerbs(_ dataController: DataController) throws {
        try dataController.clearAllVerbs()
        try loadVerbsFromFiles(dataController)
    }
    
    private static func loadVerbsFromFiles(_ dataController: DataController) throws {
        // Get paths
        guard let verbsPath = Bundle.main.path(forResource: VERBS_FILE_PATH, ofType: VERBS_FILE_TYPE) else {
            throw Exception.IOException("Unable to open \(VERBS_FILE_PATH + "." + VERBS_FILE_TYPE)")
        }
        guard let verbsWithSeinPath = Bundle.main.path(forResource: VERBS_WITH_SEIN_PATH, ofType: VERBS_FILE_TYPE) else {
            throw Exception.IOException("Unable to open \(VERBS_FILE_PATH + "." + VERBS_FILE_TYPE)")
        }
        
        // Load verbs with sein
        var verbsWithSein = Set<String>()
        for verbWithSein in try String(contentsOfFile: verbsWithSeinPath, encoding: .utf8).components(separatedBy: .newlines) {
            verbsWithSein.insert(verbWithSein)
        }

        // Load verbs
        for verb in try String(contentsOfFile: verbsPath, encoding: .utf8).components(separatedBy: .newlines) {
            let verbParts = verb.components(separatedBy: .whitespaces)
            let translations = parseValues(verbParts[4])
            let preterites = parseValues(verbParts[2])
            let perfects = parsePerfects(isWithSein: verbsWithSein.contains(verbParts[0]), values: parseValues(verbParts[3]))
            try dataController.saveVerb(isActive: true, translations: translations, preterites: preterites, perfects: perfects)
        }
        
        
    }
    
    private static func parsePerfects(isWithSein: Bool, values: Set<String>) -> Set<Perfects.PerfectHolder> {
        let auxVerb = isWithSein ? PERFECT_SIND_AUX_VERB : PERFECT_HABEN_AUX_VERB
        var perfectSet = Set<Perfects.PerfectHolder>()
        for value in values {
            perfectSet.insert(Perfects.PerfectHolder(auxVerb: auxVerb, perfect: value))
        }
        return perfectSet
    }
    
    private static func parseValues(_ values: String) -> Set<String> {
        var stringSet = Set<String>()
        for string in values.components(separatedBy: VERBS_VALUES_SEPARATOR) {
            stringSet.insert(string)
        }
        return stringSet
    }
    
}
