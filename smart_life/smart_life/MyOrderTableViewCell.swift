//
//  MyOrderTableViewCell.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/15.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class MyOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var ordertimeLabel: UILabel!
    @IBOutlet weak var ordernameLabel: UILabel!
    @IBOutlet weak var orderstatusLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
