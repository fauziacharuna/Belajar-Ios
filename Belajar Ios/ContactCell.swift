//
//  ContactCell.swift
//  Belajar Ios
//
//  Created by Fauzi Achmad Haruna on 15/10/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    @IBOutlet weak var myCellLabel: UILabel!
    @IBOutlet weak var myView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
