//
//  RootViewController.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 04/02/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var currentVerbLabel: UILabel!
    @IBOutlet weak var currentTenseLabel: UILabel!
    
    var dataController: DataController = DataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let verbs = try? dataController.loadVerbs() else {
            fatalError("Error unable to load verbs")
        }
        for verb in verbs {
            for translation in verb.translations! {
                let translationObj = translation as! Translations
                print(translationObj.translation ?? "Translation is null")
            }
            print("---")
        }
        
    }
    
    //MARK: Actions
    @IBAction func setNewRandomVerbAndTense(_ sender: UIButton) {
        currentVerbLabel.text = "New random verb! :)"
        currentTenseLabel.text = "New random tense :)"
        
        let translations: Set<String> = ["test", "test1"]
        do {
            try dataController.saveVerb(translations: translations)
        } catch {
            fatalError("Unable to save verb: \(error)")
        }
    
    }

}

