//
//  GroupViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import CountdownLabel

class GroupViewController: UIViewController, CountdownLabelDelegate, LTMorphingLabelDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let btn:UIButton = UIButton(type:.System)
//        let fromDate   = NSDate().dateByAddingTimeInterval(0)
//        let targetDate = fromDate.dateByAddingTimeInterval(50)
//        let countdownLabel = CountdownLabel(frame: CGRectMake(140, 140, 300, 100), fromDate: fromDate, targetDate: targetDate)
//        
//        self.view.addSubview(countdownLabel)
//        self.view.addSubview(btn)
//        
//        countdownLabel.textColor = UIColor.orangeColor()
//        countdownLabel.font = UIFont(name: "Courier", size: 30)
//        countdownLabel.animationType = .Sparkle
//        countdownLabel.delegate = self
//        countdownLabel.start()
//        
//        btn.frame = CGRectMake(40, 440, 100, 50)
//        btn.tintColor = UIColor.whiteColor()
//        btn.backgroundColor = UIColor.orangeColor()
//        btn.setTitle("buy", forState:UIControlState.Normal)
//        
//        countdownLabel.then(1) { [unowned self] in
//            countdownLabel.textColor = .greenColor()
//            btn.enabled = false
//        }
        
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
