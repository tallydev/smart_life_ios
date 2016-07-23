//
//  IndentCellModel.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/23.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import Foundation
import UIKit

class IndentCellModel: NSObject {
    
    // 订单编号
    var indentNumber: String?
    
    // 订单时间
    var indentdate: String?
    
    // 订单状态
    var indentState: Int?
    
    // 订单图片
    var indentCellPic: String?
    
    // 订单cell名称
    var indentGoodName: String?
    
    // 订单cell单价
    var indentGoodPrice: String?
    
    // 订单cell商品数量
    var indentGoodsNumber: String?
    
    // 字典转模型
    init(dict: [String : AnyObject]) {
        super.init()
        
        // 使用kvo为当前对象属性设置值
        setValuesForKeysWithDictionary(dict)
    }
    
    // 防止对象属性和kvc时的dict的key不匹配而崩溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}
