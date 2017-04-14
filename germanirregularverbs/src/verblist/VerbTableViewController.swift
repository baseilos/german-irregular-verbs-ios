//
//  VerbTableViewController.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 06/04/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import UIKit

class VerbTableViewController: UITableViewController {

    //MARK: Properties
    
    let dataController = DataController()
    var verbs = [Verbs]()
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.allowsSelection = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try verbs = dataController.loadVerbs()
        } catch {
            print ("Unable to load verbs")
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return verbs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VerbTableViewCell.CELL_IDENTIFIER, for: indexPath) as? VerbTableViewCell else {
            fatalError("The dequeued cell is of incorrect type")
        }
        cell.setVerb(verbs[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let verb = verbs[indexPath.row]
        let action = UITableViewRowAction(style: .normal, title: verb.active ? "Disable" : "Enable", handler: { (action, indexPath) in
            do {
                try self.dataController.updateVerb(verb, isActive: !verb.active)
                tableView.isEditing = false
                tableView.reloadData()
            } catch {
                print("Unable to update verb's active state")
            }
        })
        action.backgroundColor = verb.active ? UIColor.red : UIColor.green
        return [action];
    }

}
