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
        public private(set) var auxVerb: String {
            get {
                return self.auxVerb
            }
            set {
                self.auxVerb = newValue
            }
        }
        
        public private(set) var perfect: String {
            get {
                return self.perfect
            }
            set {
                self.perfect = newValue
            }
        }
        
        public var hashValue: Int {
            get {
                return auxVerb.hashValue ^ perfect.hashValue
            }
        }
        
        init(auxVerb: String, perfect: String) {
            self.auxVerb = auxVerb
            self.perfect = perfect
        }
        
        public static func == (lhs: PerfectHolder, rhs: PerfectHolder) -> Bool {
            return lhs.auxVerb == rhs.auxVerb && lhs.perfect == rhs.perfect
        }
    }
    
    @nonobjc public class func createPerfect(_ perfectHolder: PerfectHolder, in managedObjectContext: NSManagedObjectContext) -> Perfects {
        let perfect = NSEntityDescription.insertNewObject(forEntityName: "Perfects", into: managedObjectContext) as! Perfects
        perfect.auxverb = perfectHolder.auxVerb
        perfect.perfect = perfectHolder.perfect
        return perfect
    }
    
}
