//
//  form.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/14.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

@IBDesignable
class form: NibDesignable {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var textfield: UITextField!
    
    @IBInspectable public var iconname: String = "" {
        didSet {
            icon.image = UIImage(named: iconname)
        }
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}
