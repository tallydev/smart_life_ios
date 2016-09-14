//
//  AppDelegate.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import SwiftDate
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //后台任务
    var backgroundTask:UIBackgroundTaskIdentifier! = nil
    
    var stepInfo = [String]()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        if (NSUserDefaults.standardUserDefaults().valueForKey("userToken") == nil) {
            print("没有密码")
        }else{
            let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
            let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
            let id:Int = NSUserDefaults.standardUserDefaults().valueForKey("userId") as! Int
            
            let headers1 = ["Accept":"application/json",
                            "X-User-Token":token,
                            "X-User-Phone":phone]
            Alamofire.request(.GET, "http://elive.clfsj.com:8081/user_info", headers: headers1)
                .responseString { response in
                    var json = JSON(data: response.data!)
                    if json["errors"].isEmpty == true && json["error"].isEmpty == true{
                        
                        let nick = json["nickname"].stringValue
                        let id_card = json["identity_card"].stringValue
                        let avatar = json["avatar"].stringValue
                        let birth = json["birth"].stringValue
                        let sexy = json["sex"].stringValue
                        let slogan = json["slogan"].stringValue
                        let address = json["address"].stringValue
                        let pay_password = json["pay_password"].stringValue
                        if sexy == "male" {
                            let sex = "男"
                            userInfo = User(id: id, phone: phone, nickname: nick, avatar: avatar, birth: birth, sex: sex, slogan: slogan, address: address, identity_card: id_card, pay_password:pay_password, token: token)
                            
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.token, forKey: "userToken")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.phone, forKey: "userphone")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.id, forKey: "userId")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.nickname, forKey: "nickName")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.avatar, forKey: "avatarPic")
                            
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.birth, forKey: "birth")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.sex, forKey: "sex")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.slogan, forKey: "slogan")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.identity_card, forKey: "identity_card")
                            
                        }else{
                            let sex = "女"
                            userInfo = User(id: id, phone: phone, nickname: nick, avatar: avatar, birth: birth, sex: sex, slogan: slogan, address: address, identity_card: id_card, pay_password:pay_password, token: token)
                            
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.token, forKey: "userToken")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.phone, forKey: "userphone")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.id, forKey: "userId")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.nickname, forKey: "nickName")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.avatar, forKey: "avatarPic")
                            
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.birth, forKey: "birth")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.sex, forKey: "sex")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.slogan, forKey: "slogan")
                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.identity_card, forKey: "identity_card")
                            
                        }
                        
                        
                    }else{
                        print("自动登录失败！")
                        
                    }
                    
            }

            print("有密码")
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
            self.window?.rootViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Main")
        }
        //开启通知
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound],categories: nil)
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [UIUserNotificationType.Sound, UIUserNotificationType.Alert,UIUserNotificationType.Badge], categories: nil))
        application.registerUserNotificationSettings(settings)
        
        //设置status bar背景色半透明
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.window!.rootViewController!.view.addSubview(view)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        let controller = HomeTController()
        
        //如果已存在后台任务，先将其设为完成
        if self.backgroundTask != nil {
            application.endBackgroundTask(self.backgroundTask)
            self.backgroundTask = UIBackgroundTaskInvalid
        }
        //注册后台任务
        self.backgroundTask = application.beginBackgroundTaskWithExpirationHandler({
            () -> Void in
            //如果没有调用endBackgroundTask，时间耗尽时应用程序将被终止
            application.endBackgroundTask(self.backgroundTask)
            self.backgroundTask = UIBackgroundTaskInvalid
        })
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}




