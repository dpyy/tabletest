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
        selectionStyle = .none
    }

    func configure(for state: HiddenState) {
        switch state {
        case .hidden:
            theTextView.alpha = 0
            hiddenCon.constant = 0

        case .visible:
            theTextView.alpha = 1
            hiddenCon.constant = 100
        }
    }
}
