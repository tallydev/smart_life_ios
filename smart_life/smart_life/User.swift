//
//  User.swift
//  smart_life
//
//  Created by 张留刚 on 16/8/1.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class User: NSObject {
    var id:Int
    var phone: String
    var token: String
    
    init(id:Int, phone: String, token: String) {
        self.id = id
        self.phone = phone
        self.token = token
        super.init()
    }
}