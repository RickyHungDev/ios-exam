//
//  PersonTableViewCell.swift
//  iOS-exam
//
//  Created by Hung Ricky on 2018/7/31.
//  Copyright © 2018年 Hung Ricky. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel! {
        didSet {
            firstNameLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var lastNameLabel: UILabel! {
        didSet {
            lastNameLabel.numberOfLines = 0
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

}
