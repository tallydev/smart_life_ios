//
//  Port_Invoking.swift
//  smart_life
//
//  Created by 张留刚 on 16/8/2.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MBProgressHUD
import SwiftDate

//提交预约接口调用
func subscribe(viewController:UIViewController,type:String, count:String, orderBtn:UIButton) {
    let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
    let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
    let id:Int = NSUserDefaults.standardUserDefaults().valueForKey("userId") as! Int
    
    let headers = ["Accept":"application/json",
                   "X-User-Phone": phone,
                   "X-User-Token": token]
    
    let body = ["appointment[type]":type,
                "appointment[count]":count]
    
    Alamofire.request(.POST, "http://elive.clfsj.com:8081/appointments", headers: headers, parameters: body)
        .responseString { response in
            var json = JSON(data: response.data!)
            print(json)
            print(userInfo?.id)
            if json["errors"].isEmpty == true && json["error"].isEmpty == true {
                orderBtn.enabled = false
                orderBtn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Disabled)
                orderBtn.setTitle("申请成功", forState: .Disabled)
            }else{
                let hud = MBProgressHUD.showHUDAddedTo(viewController.view, animated: true)
                hud.mode = MBProgressHUDMode.Text
                hud.labelText = "预约提示"
                hud.detailsLabelText = "预约失败，请稍后再试!"
                
                //延迟隐藏
                hud.hide(true, afterDelay: 0.8)
            }
            
    }
}


//修改用户信息接口调用
func userInfoChange(viewController:UIViewController, bodyKey:String, bodyValue:String, forkey1:String) {
    let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
    let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
    let id:Int = NSUserDefaults.standardUserDefaults().valueForKey("userId") as! Int
    
    let headers = ["Accept":"application/json",
                   "X-User-Phone": phone,
                   "X-User-Token": token]
    let body = [bodyKey:bodyValue]
    Alamofire.request(.PUT, "http://elive.clfsj.com:8081/user_info", headers: headers, parameters: body)
        .responseString { response in
            var json = JSON(data: response.data!)
            if json["errors"].isEmpty == true && json["error"].isEmpty == true{
                
                let key = json[forkey1].stringValue
                if forkey1 == "avatar" {
                    userInfo?.avatar = key
                    NSUserDefaults.standardUserDefaults().setObject(userInfo!.avatar, forKey: "avatar")
                    MyDataTableViewController().tableView.reloadData()
                }else if forkey1 == "nickname"{
                    userInfo?.nickname = key
                    NSUserDefaults.standardUserDefaults().setObject(userInfo!.nickname, forKey: "nickname")
                    MyDataTableViewController().tableView.reloadData()
                }else if forkey1 == "birth"{
                    userInfo?.birth = key
                    NSUserDefaults.standardUserDefaults().setObject(userInfo!.birth, forKey: "birth")
                    MyDataTableViewController().tableView.reloadData()
                }else if forkey1 == "sex"{
                    if key == "male" {
                        userInfo?.sex = "男"
                        NSUserDefaults.standardUserDefaults().setObject(userInfo!.sex, forKey: "sex")
                        MyDataTableViewController().tableView.reloadData()
                    }else{
                        userInfo?.sex = "女"
                        NSUserDefaults.standardUserDefaults().setObject(userInfo!.sex, forKey: "sex")
                        MyDataTableViewController().tableView.reloadData()
                    }
                }else if forkey1 == "slogan"{
                    userInfo?.slogan = key
                    NSUserDefaults.standardUserDefaults().setObject(userInfo!.slogan, forKey: "slogan")
                    MyDataTableViewController().tableView.reloadData()
                }else if forkey1 == "identity_card"{
                    userInfo?.identity_card = key
                    NSUserDefaults.standardUserDefaults().setObject(userInfo!.identity_card, forKey: "identity_card")
                    MyDataTableViewController().tableView.reloadData()
                }else{
                    userInfo?.pay_password = key
                    NSUserDefaults.standardUserDefaults().setObject(userInfo!.pay_password, forKey: "pay_password")
                    MyDataTableViewController().tableView.reloadData()
                }
                MBProgressHUD.showHUDAddedTo(viewController.view, animated: true)
            }else{
                
                let hud = MBProgressHUD.showHUDAddedTo(viewController.view, animated: true)
                hud.mode = MBProgressHUDMode.Text
                hud.labelText = "修改失败！"
                //延迟隐藏
                hud.hide(true, afterDelay: 0.8)
                
            }
            
    }
}

//获取运动数据方法调用
func getStepsNumber(interval:Int) {
    //判断该设备是否支持计步功能
    if CMPedometer.isStepCountingAvailable(){
        let startTime = NSDate()
        let endTime = NSDate()
        let now = NSDate()
        
        for i in 0...interval {
            if interval == 24 {
                
            }else if interval == 7 {
                
            }else if interval == 12 {
                
            }else{
                
            }
        
        
        
            pedonmeter.queryPedometerDataFromDate(_: startTime, toDate: endTime, withHandler: { (pedometerData:CMPedometerData?, error:NSError?) -> Void in
                if error != nil{
                    print("error:\(error)")
                }else{
                    print("开始时间:\(startTime)")
                    print("结束时间:\(endTime)")
                    print("步数===\(pedometerData!.numberOfSteps)")
                    print("距离===\(pedometerData!.distance)")
                    
                }
            })
        }
    } else {
        print("there has something with CMPedometer")
    }
}


//获取步数排名接口调用
func getStepRanks(viewController:UIViewController, ranking:[String], username:[String], userimage:[String], step:[String]) {
    var data = NSDictionary()
    let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
    let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
    let id:Int = NSUserDefaults.standardUserDefaults().valueForKey("userId") as! Int
    
    let headers = ["Accept":"application/json",
                   "X-User-Phone": phone,
                   "X-User-Token": token]
    
    var ranks = [String]()
    var user = [String]()
    var image = [String]()
    var stp = [String]()
    
    Alamofire.request(.GET, "http://elive.clfsj.com:8081/ranks/weekly", headers: headers)
        .responseString { response in
            var json = JSON(data: response.data!)
            print(json)
            print(userInfo?.id)
            if json["errors"].isEmpty == true && json["error"].isEmpty == true {
                
                for (_, value1) in json["top"] {
                    ranks.append(value1["id"].stringValue)
                    user.append(value1["name"].stringValue)
                    image.append(value1["alarm"].stringValue)
                    stp.append(value1["alarm"].stringValue)
                }

                
            }else{
                let hud = MBProgressHUD.showHUDAddedTo(viewController.view, animated: true)
                hud.mode = MBProgressHUDMode.Text
                hud.labelText = "预约提示"
                hud.detailsLabelText = "预约失败，请稍后再试!"
                
                //延迟隐藏
                hud.hide(true, afterDelay: 0.8)
            }
            
    }
//    return
}