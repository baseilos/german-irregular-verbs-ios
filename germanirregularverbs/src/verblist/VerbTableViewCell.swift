//
//  VerbTableViewCell.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 06/04/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import UIKit

class VerbTableViewCell: UITableViewCell {
    
    static let CELL_IDENTIFIER = "VerbTableViewCell"

    //MARK: Properties
    @IBOutlet weak var presentTenseLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var perfectTenseLabel: UILabel!
    @IBOutlet weak var preteriteTenseLabel: UILabel!
    
    func setVerb(_ verb: Verbs) {
        presentTenseLabel.text = verb.present
        if let translations = verb.translations, let perfects = verb.perfects, let preterites = verb.preterites {
            translationLabel.text = joinValues(translations, mapFunc: Translations.convertToString)
            perfectTenseLabel.text = joinValues(perfects, mapFunc: Perfects.convertToString)
            preteriteTenseLabel.text = joinValues(preterites, mapFunc: Preterites.convertToString)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func joinValues(_ set: NSSet, mapFunc: (Any) -> String) -> String {
        return set.map(mapFunc).joined(separator: ", ")
    }

}
