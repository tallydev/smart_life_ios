//
//  alertFrameS.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/25.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

@IBDesignable
class alertFrameS: NibDesignable {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var deleteOrderBtn: UIButton!
    
    @IBInspectable public var text: String = "" {
        didSet {
            self.descriptionLabel.text = text
        }
    }
}