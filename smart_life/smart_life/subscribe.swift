//
//  subscribe.swift
//  smart_life
//
//  Created by 张留刚 on 16/8/2.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MBProgressHUD

func subscribe(viewController:UIViewController,type:String, count:String, orderBtn:UIButton) {
    let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
    let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
    let id:Int = NSUserDefaults.standardUserDefaults().valueForKey("userId") as! Int
    
    let headers = ["Accept":"application/json",
                   "X-User-Phone": phone,
                   "X-User-Token": token]
    
    let body = ["appointment[type]":type,
                "appointment[count]":count]
    
    Alamofire.request(.POST, "http://220.163.125.158:8081/appointments", headers: headers, parameters: body)
        .responseString { response in
            var json = JSON(data: response.data!)
            print(json)
            print(userInfo?.id)
            if json["errors"].isEmpty == true && json["error"].isEmpty == true {
                orderBtn.enabled = false
                orderBtn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Disabled)
                orderBtn.setTitle("申请成功", forState: .Disabled)
            }else{
                var hud = MBProgressHUD.showHUDAddedTo(viewController.view, animated: true)
                hud.mode = MBProgressHUDMode.Text
                hud.labelText = "预约提示"
                hud.detailsLabelText = "预约失败，请稍后再试!"
                
                //延迟隐藏
                hud.hide(true, afterDelay: 0.8)
            }
            
    }
}