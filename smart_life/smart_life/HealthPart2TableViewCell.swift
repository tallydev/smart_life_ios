//
//  HealthPart2TableViewCell.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class HealthPart2TableViewCell: UITableViewCell {
    @IBOutlet weak var itemlabel: UILabel!
    @IBOutlet weak var rangepic: UIImageView!
    @IBOutlet weak var resultlabel: UILabel!
    @IBOutlet weak var rangelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
