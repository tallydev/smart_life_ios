//
//  Report.swift
//  smart_life
//
//  Created by 张留刚 on 16/8/10.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class Report: NSObject {
    var name:String?
    var alias: String?
    var hint:String?
    var value:String?
    var state:String?
    
    // 字典转模型
    init(dict: [String : AnyObject]) {
        super.init()
        // 使用kvo为当前对象属性设置值
        setValuesForKeysWithDictionary(dict)
    }
    
    // 防止对象属性和kvc时的dict的key不匹配而崩溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}