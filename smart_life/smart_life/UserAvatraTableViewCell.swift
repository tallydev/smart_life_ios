//
//  UserAvatraTableViewCell.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/19.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class UserAvatraTableViewCell: UITableViewCell {

    @IBOutlet weak var avatraLabel: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
