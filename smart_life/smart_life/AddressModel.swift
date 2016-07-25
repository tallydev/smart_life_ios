//
//  AddressModel.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/22.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class AddressModel: NSObject {
    
    // 商品图片名称
    var userName: String?
    
    // 商品标题
    var address: String?
    
    // 商品描述
    var phone: String?
    
    // 是否选中，默认没有选中
    var selected: Bool = false
    
    // 是否选中，默认没有选中
    var isdefault: Bool = false
    
    // 字典转模型
    init(dict: [String : AnyObject]) {
        super.init()
        
        // 使用kvo为当前对象属性设置值
        setValuesForKeysWithDictionary(dict)
    }
    
    // 防止对象属性和kvc时的dict的key不匹配而崩溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}
