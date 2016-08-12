//
//  Sport.swift
//  smart_life
//
//  Created by 张留刚 on 16/8/6.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class Sport: NSObject {
    var today_count:String?
    var avg_count:String?
    var count:String?
    var rank:String?
    var rank_percent:String?

    
    // 字典转模型
    init(dict: [String : AnyObject]) {
        super.init()
        
        // 使用kvo为当前对象属性设置值
        setValuesForKeysWithDictionary(dict)
    }
    
    // 防止对象属性和kvc时的dict的key不匹配而崩溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}}