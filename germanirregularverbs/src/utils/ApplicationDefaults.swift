//
//  ApplicationDefaults.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 02/04/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import Foundation

class ApplicationDefaults {
    
    fileprivate static let HAS_VERB_DATA_BEEN_INITIALIZED_KEY = "has_data_been_initalized"
    
    static func hasDataBeenInitialized() -> Bool {
        return UserDefaults.standard.bool(forKey: HAS_VERB_DATA_BEEN_INITIALIZED_KEY)
    }
    
    static func setDataHasBeenInitialized(_ isInitialized: Bool) {
        UserDefaults.standard.set(isInitialized, forKey: HAS_VERB_DATA_BEEN_INITIALIZED_KEY)
    }
    
}
