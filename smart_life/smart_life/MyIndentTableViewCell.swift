//
//  MyIndentTableViewCell.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/15.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class MyIndentTableViewCell: UITableViewCell {

    @IBOutlet weak var indentnumber: UILabel!
    @IBOutlet weak var indenttime: UILabel!
    @IBOutlet weak var indentstatus: UILabel!
    @IBOutlet weak var indentimg: UIImageView!
    @IBOutlet weak var indentname: UILabel!
    @IBOutlet weak var unitcost: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var payway: UILabel!
    @IBOutlet weak var totalvalue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
