//
//  MyInfoViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/15.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD

class MyInfoViewController: UIViewController {
    
    let Center = NSNotificationCenter.defaultCenter()

    @IBOutlet weak var loginOut: UIButton!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var userAvatar: UIImageView!
    @IBAction func goOutBtnAction(sender: AnyObject) {
        //返回登陆页
        NSUserDefaults.standardUserDefaults().removeObjectForKey("passWord")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("userToken")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("userphone")
        
        public_timer.invalidate()
        public_timer = nil
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        self.view.window?.rootViewController = mainStoryboard.instantiateViewControllerWithIdentifier("signInNavViewController")
        
//        let signinVc = SignInViewController()
//        presentViewController(UINavigationController(rootViewController: signinVc), animated: true, completion: nil)
//        NSUserDefaults.standardUserDefaults().removeObjectForKey("passWord")
    }
    @IBAction func myHealth(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("NAV12")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func mysport(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("NAV21")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func myorder(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("MyOrder")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func mydata(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("MyData")
        ModifyViewController().delegate = self
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func myindent(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("MyIndent")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func service(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string :"tel://087164589208")!)
    }
    
    override func viewWillAppear(animated: Bool) {
        Center.addObserver(self, selector: Selector("Command:"), name: String(classForCoder), object: nil)
        super.viewWillAppear(animated)
    }
    
    deinit {
        Center.removeObserver(self)
    }
    
    func Command(notification:NSNotification){
        if userInfo?.avatar.isEmpty == true {
            userAvatar.image = UIImage(named: "个人中心-29")
        }else{
            userAvatar.imageFromURL((userInfo?.avatar)!,placeholder: (UIImage(named:"个人中心-29")?.roundCornersToCircle(border: 40,
                color: UIColor.orangeColor())!)!)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)
        if userInfo?.avatar.isEmpty == true {
            userAvatar.image = UIImage(named: "个人中心-29")
        }else{
            userAvatar.imageFromURL((userInfo?.avatar)!,placeholder: (UIImage(named:"个人中心-29")?.roundCornersToCircle(border: 40,
                color: UIColor.orangeColor())!)!)
        }
        nickNameLabel.text = userInfo?.nickname
        
        loginOut.layer.borderWidth = 1
        loginOut.layer.borderColor = UIColor.orangeColor().CGColor
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension MyInfoViewController: SendDelegate {
    
    func sendUserinfo(message:String, kek:String) {
        userInfo?.setValue(message, forKey: kek)
        userAvatar.imageFromURL((userInfo?.avatar)!,placeholder: (UIImage(named:"个人中心-29")?.roundCornersToCircle(border: 40,
            color: UIColor.orangeColor())!)!)
        nickNameLabel.text = userInfo?.nickname
        print(nickNameLabel.text)
    }
}
