//
//  OrderBtn.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/14.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

@IBDesignable
class OrderBtn: NibDesignable {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var numberlabelname: UILabel!
    
    var member:Int = 1
    @IBAction func addBtnAction(sender: AnyObject) {
        member = member+1
        numberLabel.text = String(member)
    }
    
    @IBInspectable public var name: String = "" {
        didSet {
            self.numberlabelname.text = name
        }
    }
    
    @IBAction func delBtnAction(sender: AnyObject) {
        member = member-1
        if member >= 1 {
            numberLabel.text = String(member)
        }else{
            member = 1
            numberLabel.text = "1"
        }
    }
    
    @IBAction func orderBtnAction(sender: AnyObject) {
        
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
