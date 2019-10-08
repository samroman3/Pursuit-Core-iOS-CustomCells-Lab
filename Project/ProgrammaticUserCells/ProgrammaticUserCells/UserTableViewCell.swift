//
//  UserTableViewCell.swift
//  ProgrammaticUserCells
//
//  Created by Sam Roman on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
