//
//  TableViewCell.swift
//  Test
//
//  Created by Gary Fung on 2020-01-30.
//  Copyright © 2020 Gary Fung. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet var hiddenCon: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
