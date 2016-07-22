//
//  FitnessTableViewCell.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/14.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class FitnessTableViewCell: UITableViewCell {

    @IBOutlet weak var supportNumber: UILabel!
    @IBOutlet weak var supportIcon: UIImageView!
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
