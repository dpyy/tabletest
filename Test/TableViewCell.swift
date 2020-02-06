//
//  TableViewCell.swift
//  Test
//
//  Created by Gary Fung on 2020-01-30.
//  Copyright © 2020 Gary Fung. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet var theTextView: UITextView!
    @IBOutlet var hiddenCon: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var tableUpdateCallback: (()->())?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func grow() {
        UIView.animate(withDuration: 0.5) {
            self.theTextView.alpha = 0.0
            self.hiddenCon.constant = 0
            self.contentView.layoutIfNeeded()
            self.tableUpdateCallback?()
        }
    }

}
