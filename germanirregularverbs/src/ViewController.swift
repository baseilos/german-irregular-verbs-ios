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
    }
    
    //MARK: Actions
    @IBAction func setNewRandomVerbAndTense(_ sender: UIButton) {
        currentVerbLabel.text = "New random verb! :)"
        currentTenseLabel.text = "New random tense :)"
        do {
            try VerbLoader.initVerbs(dataController)
            for verb in try dataController.loadVerbs() {
                print ("\(verb.active), \(verb.perfects), \(verb.preterites), \(verb.translations)")
            }
        } catch {
            print ("Unable to load verbs from files")
        }
    }

}

