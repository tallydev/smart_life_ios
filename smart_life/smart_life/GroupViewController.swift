//
//  GroupViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //发送通知消息
        scheduleNotification();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scheduleNotification(){
        //清除所有本地推送
        UIApplication.sharedApplication().cancelAllLocalNotifications()
        
        //创建UILocalNotification来进行本地消息通知
        let localNotification = UILocalNotification()
        //设置应用程序右上角的提醒个数
        localNotification.applicationIconBadgeNumber = 78;
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
