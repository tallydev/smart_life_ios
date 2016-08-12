//
//  Rank.swift
//  smart_life
//
//  Created by 张留刚 on 16/8/10.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class Rank: NSObject {
    var name:String
    var alias: String
    var hint:String
    var value:String
    var state:String
    
    init(name:String, alias: String, hint:String, value:String, state:String) {
        self.name = name
        self.alias = alias
        self.hint = hint
        self.value = value
        self.state = state
        super.init()
    }
}