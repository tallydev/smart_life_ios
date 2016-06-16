////
////  Home_Cell.swift
////  smart_life
////
////  Created by 张留刚 on 16/6/15.
////  Copyright © 2016年 张留刚. All rights reserved.
////
//
//import UIKit
//
//class Home_Cell: UICollectionViewCell {
//    let width = UIScreen.mainScreen().bounds.size.width//获取屏幕宽
//    var imgView : UIImageView?//cell上的图片
//    var titleLabel:UILabel?//cell上title
//    var priceLabel:UILabel?//cell上价格
//    var readLabel:UILabel?//cell上的阅读量
//    
//    
//    override init(frame: CGRect) {
//        
//        super.init(frame: frame)
//        //初始化各种控件
//        imgView = UIImageView(frame: CGRectMake(0, -10, (width-30)/2, 200))
//        self .addSubview(imgView!)
//        
//        titleLabel = UILabel(frame: CGRectMake(5, CGRectGetMaxY(imgView!.frame)-12, (width-40)/2, 50))
//        titleLabel?.numberOfLines = 0
//        titleLabel?.font = UIFont.boldSystemFontOfSize(14.0)
//        titleLabel?.textColor = UIColor.lightGrayColor()
//        self .addSubview(titleLabel!)
//        
//        priceLabel = UILabel(frame: CGRectMake(5, CGRectGetMaxY(titleLabel!.frame), (width-40)/2/2, 20))
//        priceLabel?.numberOfLines = 0
//        priceLabel?.font = UIFont.boldSystemFontOfSize(14.0)
//        priceLabel?.textColor = UIColor.lightGrayColor()
//        self .addSubview(priceLabel!)
//        
//        readLabel = UILabel(frame: CGRectMake((width-30)/2/2, CGRectGetMaxY(titleLabel!.frame), (width-40)/2/2, 20))
//        readLabel?.numberOfLines = 0
//        readLabel?.textAlignment = NSTextAlignment.Right
//        readLabel?.font = UIFont.boldSystemFontOfSize(14.0)
//        readLabel?.textColor = UIColor.lightGrayColor()
//        self .addSubview(readLabel!)
//        
//        
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
