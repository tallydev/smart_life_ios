//
//  UIView+BHBFreeBorder.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/22.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import Foundation
import UIKit

@objc enum BorderType:NSInteger{
    
    case top,left,bottom,right
    
}
extension UIView{
    
    // MARK: - 为视图加上边框 ，枚举数组可以填充上下左右四个边
    @objc func addBorder(color: UIColor?, size: CGFloat, borderTypes:NSArray){
        
        var currentColor:UIColor?
        
        if let _ = color{
            currentColor = color
        }else{
            currentColor = UIColor.blackColor()
        }
        
        for borderType in borderTypes{
            let bt: NSNumber = borderType as! NSNumber
            self.addBorderLayer(currentColor!, size: size, boderType: BorderType(rawValue: bt.integerValue)!)
        }
        
    }
    
    @objc func addBorderLayer(color: UIColor, size: CGFloat, boderType: BorderType){
        
        let layer:CALayer = CALayer()
        layer.backgroundColor = color.CGColor
        self.layer.addSublayer(layer)
        
        switch boderType{
            
        case .top:
            layer.frame = CGRectMake(0, 0, self.frame.width, size)
            
        case .left:
            layer.frame = CGRectMake(0, 0, size, self.frame.height)
            
        case .bottom:
            layer.frame = CGRectMake(0, self.frame.height - size, self.frame.width, size)
            
        case .right:
            layer.frame = CGRectMake(self.frame.width - size, 0, size, self.frame.height)
            
            
            //        default:
            //            return;
            
        }
        
    }
    
}