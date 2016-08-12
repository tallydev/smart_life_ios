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
    var avatar: String
    var birth: String
    var sex: String
    var slogan: String
    var identity_card: String
    var nickname: String
    var address:String
    var pay_password:String
    var token: String
    
    init(id:Int, phone: String, nickname:String, avatar: String, birth: String, sex: String, slogan: String, address:String, identity_card: String, pay_password:String, token: String) {
        self.id = id
        self.phone = phone
        self.nickname = nickname
        self.address = address
        self.avatar = avatar
        self.birth = birth
        self.identity_card = identity_card
        self.sex = sex
        self.slogan = slogan
        self.token = token
        self.pay_password = pay_password
        super.init()
    }
}