//
//  IconBtn.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/14.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

@IBDesignable
class IconBtn: NibDesignable {
    
    @IBOutlet weak var btnicon: UIImageView!
    
    @IBOutlet weak var btnname: UILabel!
    
    @IBInspectable public var name: String = "" {
        didSet {
            self.btnname.text = name
        }
    }
    
    @IBInspectable public var profileImage: UIImage = UIImage() {
        didSet {
            let size = self.profileImage.size
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            let path = UIBezierPath(ovalInRect: rect)
            path.addClip()
            self.profileImage.drawInRect(rect)
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.btnicon.image = image
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
