//
//  Perfects+CoreDataClass.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 18/02/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation
import CoreData


public class Perfects: NSManagedObject {
    
    // MARK: Inner classes & structs
    public struct PerfectHolder: Hashable {
        
        private var _auxVerb: String
        public var auxVerb: String {
            get {
                return self._auxVerb
            }
        }
        
        private var _perfect: String
        public var perfect: String {
            get {
                return self._perfect
            }
        }
        
        public var hashValue: Int {
            get {
                return _auxVerb.hashValue ^ _perfect.hashValue
            }
        }
        
        init(auxVerb: String, perfect: String) {
            _auxVerb = auxVerb
            _perfect = perfect
        }
        
        public static func == (lhs: PerfectHolder, rhs: PerfectHolder) -> Bool {
            return lhs._auxVerb == rhs._auxVerb && lhs._perfect == rhs._perfect
        }
    }
    
    @nonobjc public class func createPerfect(_ perfectHolder: PerfectHolder, in managedObjectContext: NSManagedObjectContext) -> Perfects {
        let perfect = NSEntityDescription.insertNewObject(forEntityName: "Perfects", into: managedObjectContext) as! Perfects
        perfect.auxverb = perfectHolder.auxVerb
        perfect.perfect = perfectHolder.perfect
        return perfect
    }
    
    @nonobjc public class func convertToString(_ value: Any) -> String {
        let perfect = value as! Perfects
        return perfect.auxverb! + " " + perfect.perfect!
    }
    
}
