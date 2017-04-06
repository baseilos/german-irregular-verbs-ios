//
//  VerbTableViewCell.swift
//  germanirregularverbs
//
//  Created by Jozef Lang on 06/04/2017.
//  Copyright © 2017 Jozef Lang. All rights reserved.
//

import UIKit

class VerbTableViewCell: UITableViewCell {

    //MARK: Properties
    
    static let CELL_IDENTIFIER = "VerbTableViewCell"
    
    @IBOutlet weak var verbLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
