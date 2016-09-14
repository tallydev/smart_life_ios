//
//  SignUpViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/24.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        // 准备UI
        prepareUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 布局UI
        layoutUI()
    }
    
    /**
     准备UI
     */
    private func prepareUI() {
        
        // 标题
        navigationItem.title = "登 录"
        
        
        view.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
        // 添加子控件
        self.view.addSubview(addressView)
        self.view.addSubview(signInBtn)
        self.view.addSubview(signUpBtn)
        
        addressView.addSubview(cellView1)
        addressView.addSubview(cellView2)
        
        cellView1.addSubview(orderNameView)
        cellView1.addSubview(orderTexeField)
        cellView2.addSubview(phoneNameView)
        cellView2.addSubview(phoneNumberTexeField)
        
        orderNameView.addSubview(orderNameLabel)
        phoneNameView.addSubview(phoneNameLabel)
        
    }
    
    /**
     布局UI
     */
    private func layoutUI() {
        // 约束子控件
        addressView.snp_makeConstraints { (make) in
            make.top.equalTo(68)
            make.left.equalTo(4)
            make.right.equalTo(-4)
            make.height.equalTo(101)
        }
        
        cellView1.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(50.5)
        }
        cellView2.snp_makeConstraints { (make) in
            make.top.equalTo(50.5)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(50.5)
        }
        
        orderNameView.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }
        orderNameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(15)
            make.width.equalTo(14)
            make.height.equalTo(20)
        }
        orderTexeField.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
            make.height.equalTo(50)
        }
        
        phoneNameView.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }
        phoneNameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(18)
            make.top.equalTo(16)
            make.width.equalTo(18)
            make.height.equalTo(15)
        }
        phoneNumberTexeField.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
            make.height.equalTo(50)
        }
        
        
        signInBtn.snp_makeConstraints { (make) in
            make.top.equalTo(cellView2.snp_bottom).offset(25)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(45)
        }
        
        signUpBtn.snp_makeConstraints { (make) in
            make.top.equalTo(signInBtn.snp_bottom).offset(30)
            make.width.equalTo(80)
            make.centerX.equalTo(signInBtn.snp_centerX)
        }
    }
    
    // MARK: - 懒加载
    
    lazy var addressView: UIView = {
        let addressView = UIView()
        addressView.backgroundColor = UIColor.whiteColor()
        
        return addressView
    }()
    
    lazy var cellView1: UIView = {
        let cellView1 = UIView()
        cellView1.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
        return cellView1
    }()
    lazy var cellView2: UIView = {
        let cellView2 = UIView()
        cellView2.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
        return cellView2
    }()
    
    lazy var orderNameView: UIView = {
        let orderNameView = UIView()
        orderNameView.backgroundColor = UIColor.whiteColor()
        return orderNameView
    }()
    lazy var orderNameLabel: UIImageView = {
        let orderNameLabel = UIImageView()
        orderNameLabel.image = UIImage(named: "注册-3")
        
        return orderNameLabel
    }()
    lazy var orderTexeField: UITextField = {
        let orderTexeField = UITextField()
        orderTexeField.placeholder = "请输入您的手机号"
        orderTexeField.delegate = self
        orderTexeField.clearButtonMode = UITextFieldViewMode.WhileEditing
        orderTexeField.font = UIFont(name:"Helvetica", size:14)
        orderTexeField.textAlignment = NSTextAlignment.Left
        
        orderTexeField.backgroundColor = UIColor.whiteColor()
        return orderTexeField
    }()
    
    lazy var phoneNameView: UIView = {
        let phoneNameView = UIView()
        phoneNameView.backgroundColor = UIColor.whiteColor()
        return phoneNameView
    }()
    lazy var phoneNameLabel: UIImageView = {
        let phoneNameLabel = UIImageView()
        phoneNameLabel.image = UIImage(named: "注册-5")
        return phoneNameLabel
    }()
    lazy var phoneNumberTexeField: UITextField = {
        let phoneNumberTexeField = UITextField()
        phoneNumberTexeField.placeholder = "请输入密码"
        phoneNumberTexeField.secureTextEntry = true
        phoneNumberTexeField.delegate = self
        phoneNumberTexeField.clearButtonMode = UITextFieldViewMode.WhileEditing
        phoneNumberTexeField.font = UIFont(name:"Helvetica", size:14)
        phoneNumberTexeField.textAlignment = NSTextAlignment.Left
        phoneNumberTexeField.backgroundColor = UIColor.whiteColor()
        return phoneNumberTexeField
    }()
    
    lazy var signInBtn:UIButton = {
        let signInBtn = UIButton(type:.System)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        signInBtn.setTitle("登 录",forState:.Normal)
        signInBtn.titleLabel?.font = UIFont(name:"Helvetica", size:20)
        signInBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signInBtn.backgroundColor = UIColor.orangeColor()
        signInBtn.addTarget(self, action:#selector(SignInViewController.getMainPage),forControlEvents: UIControlEvents.TouchUpInside)
        return signInBtn
    }()
    lazy var signUpBtn:UIButton = {
        let signUpBtn = UIButton(type:.System)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        signUpBtn.setTitle("注册新用户",forState:.Normal)
        signUpBtn.titleLabel?.font = UIFont(name:"Helvetica", size:14)
        signUpBtn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        signUpBtn.layer.borderWidth = 1
        signUpBtn.layer.borderColor = UIColor.orangeColor().CGColor
        signUpBtn.layer.cornerRadius = 3
        signUpBtn.addTarget(self, action:#selector(SignInViewController.getsigninViewValue),forControlEvents: UIControlEvents.TouchUpInside)
        return signUpBtn
    }()
    
}

extension SignInViewController: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        NSLog("textField")
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder() //这个隐藏(放弃)虚拟键盘
        
        return true
        
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        orderTexeField.resignFirstResponder()
        phoneNumberTexeField.resignFirstResponder()
    }
    
}

extension SignInViewController {
    func getsigninViewValue(){
        let signUpVc = SignUpViewController()
        presentViewController(UINavigationController(rootViewController: signUpVc), animated: true, completion: nil)
    }
    
    func getMainPage(){
//        if (NSUserDefaults.standardUserDefaults().valueForKey("userToken") == nil) {
            let tempResult:String = orderTexeField.text!
            let passWord:String = phoneNumberTexeField.text!
            NSUserDefaults.standardUserDefaults().setObject(self.phoneNumberTexeField.text, forKey: "passWord")
            
            let headers = ["Accept":"application/json",]
            let body = [
                "user[phone]": tempResult,
                "user[password]": passWord
                
            ]
            Alamofire.request(.POST, "http://elive.clfsj.com:8081/users/sign_in", headers: headers, parameters: body)
                .responseString { response in
                    var json = JSON(data: response.data!)
                    if let userToken = json["authentication_token"].string {
                        if userToken.isEmpty == false {
                            let token = json["authentication_token"].stringValue
                            let phone = json["phone"].stringValue
                            let id = json["id"].int
                            
                            
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
                                            userInfo = User(id: id!, phone: phone, nickname: nick, avatar: avatar, birth: birth, sex: sex, slogan: slogan, address: address, identity_card: id_card, pay_password:pay_password, token: token)
                                            
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
                                            userInfo = User(id: id!, phone: phone, nickname: nick, avatar: avatar, birth: birth, sex: sex, slogan: slogan, address: address, identity_card: id_card, pay_password:pay_password, token: token)
                                            
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
                                        
                                        var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                                        hud.mode = MBProgressHUDMode.Text
                                        hud.labelText = "添加昵称失败！"
                                        //延迟隐藏
                                        hud.hide(true, afterDelay: 0.8)
                                        
                                    }
                                    
                            }
                            
                            
                            MBProgressHUD .showHUDAddedTo(self.view, animated: true)
                            self.performSegueWithIdentifier("login", sender: self)
                        }
                    }else{
                        var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                        hud.mode = MBProgressHUDMode.Text
                        hud.labelText = "登录提示"
                        hud.detailsLabelText = "您输入的手机或用户密码有误，请重新输入！"
                        
                        //延迟隐藏
                        hud.hide(true, afterDelay: 0.8)
                    }
                    
            }

            
//        }else{
//            let tempResult:String = (NSUserDefaults.standardUserDefaults().valueForKey("userphone") as? String)!
//            let passWord:String = (NSUserDefaults.standardUserDefaults().valueForKey("passWord") as? String)!
//            
//            let headers = ["Accept":"application/json",]
//            let body = [
//                "user[phone]": tempResult,
//                "user[password]": passWord
//                
//            ]
//            Alamofire.request(.POST, "http://elive.clfsj.com:8081/users/sign_in", headers: headers, parameters: body)
//                .responseString { response in
//                    var json = JSON(data: response.data!)
//                    if let userToken = json["authentication_token"].string {
//                        if userToken.isEmpty == false {
//                            let token = json["authentication_token"].stringValue
//                            let phone = json["phone"].stringValue
//                            let id = json["id"].int
//                            
//                            
//                            let headers1 = ["Accept":"application/json",
//                                "X-User-Token":token,
//                                "X-User-Phone":phone]
//                            Alamofire.request(.GET, "http://elive.clfsj.com:8081/user_info", headers: headers1)
//                                .responseString { response in
//                                    var json = JSON(data: response.data!)
//                                    if json["errors"].isEmpty == true && json["error"].isEmpty == true{
//                                        
//                                        let nick = json["nickname"].stringValue
//                                        let id_card = json["identity_card"].stringValue
//                                        let avatar = json["avatar"].stringValue
//                                        let birth = json["birth"].stringValue
//                                        let sexy = json["sex"].stringValue
//                                        let slogan = json["slogan"].stringValue
//                                        let address = json["address"].stringValue
//                                        let pay_password = json["pay_password"].stringValue
//                                        if sexy == "male" {
//                                            let sex = "男"
//                                            userInfo = User(id: id!, phone: phone, nickname: nick, avatar: avatar, birth: birth, sex: sex, slogan: slogan, address: address, identity_card: id_card, pay_password:pay_password, token: token)
//                                            
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.token, forKey: "userToken")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.phone, forKey: "userphone")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.id, forKey: "userId")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.nickname, forKey: "nickName")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.avatar, forKey: "avatarPic")
//                                            
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.birth, forKey: "birth")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.sex, forKey: "sex")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.slogan, forKey: "slogan")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.identity_card, forKey: "identity_card")
//                                            
//                                        }else{
//                                            let sex = "女"
//                                            userInfo = User(id: id!, phone: phone, nickname: nick, avatar: avatar, birth: birth, sex: sex, slogan: slogan, address: address, identity_card: id_card, pay_password:pay_password, token: token)
//                                            
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.token, forKey: "userToken")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.phone, forKey: "userphone")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.id, forKey: "userId")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.nickname, forKey: "nickName")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.avatar, forKey: "avatarPic")
//                                            
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.birth, forKey: "birth")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.sex, forKey: "sex")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.slogan, forKey: "slogan")
//                                            NSUserDefaults.standardUserDefaults().setObject(userInfo!.identity_card, forKey: "identity_card")
//                                            
//                                        }
//                                        
//                                        
//                                        MBProgressHUD .showHUDAddedTo(self.view, animated: true)
//                                        self.performSegueWithIdentifier("login", sender: self)
//                                        
//                                    }else{
//                                        
//                                        var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
//                                        hud.mode = MBProgressHUDMode.Text
//                                        hud.labelText = "添加昵称失败！"
//                                        //延迟隐藏
//                                        hud.hide(true, afterDelay: 0.8)
//                                        
//                                    }
//                                    
//                            }
//                            
//                            
//                            MBProgressHUD .showHUDAddedTo(self.view, animated: true)
//                            self.performSegueWithIdentifier("login", sender: self)
//                        }
//                    }else{
//                        var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
//                        hud.mode = MBProgressHUDMode.Text
//                        hud.labelText = "登录提示"
//                        hud.detailsLabelText = "您输入的手机或用户密码有误，请重新输入！"
//                        
//                        //延迟隐藏
//                        hud.hide(true, afterDelay: 0.8)
//                    }
//                    
//            }
//
//        }
    }
}


