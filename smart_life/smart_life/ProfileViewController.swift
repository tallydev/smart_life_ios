//
//  ProfileViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    //用户密码输入框
    var txtUser:UITextField!
    var txtPwd:UITextField!
    
    //在背景点击事件中，关闭虚拟键盘
    @IBAction func viewClick(sender: AnyObject) {
        txtUser.resignFirstResponder()
        txtPwd.resignFirstResponder()
    }
    
    //左手离脑袋的距离
    var offsetLeftHand:CGFloat = 60
    
    //左手图片,右手图片(遮眼睛的)
    var imgLeftHand:UIImageView!
    var imgRightHand:UIImageView!
    
    //左手图片,右手图片(圆形的)
    var imgLeftHandGone:UIImageView!
    var imgRightHandGone:UIImageView!
    
    //登录框状态
    var showType:LoginShowType = LoginShowType.NONE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取屏幕尺寸
        let mainSize = UIScreen.mainScreen().bounds.size
        
        //猫头鹰头部
        let imgLogin =  UIImageView(frame:CGRectMake(mainSize.width/2-211/2, 100, 211, 109))
        imgLogin.image = UIImage(named:"owl-login")
        imgLogin.layer.masksToBounds = true
        self.view.addSubview(imgLogin)
        
        //猫头鹰左手(遮眼睛的)
        let rectLeftHand = CGRectMake(61 - offsetLeftHand, 90, 40, 65)
        imgLeftHand = UIImageView(frame:rectLeftHand)
        imgLeftHand.image = UIImage(named:"owl-login-arm-left")
        imgLogin.addSubview(imgLeftHand)
        
        //猫头鹰右手(遮眼睛的)
        let rectRightHand = CGRectMake(imgLogin.frame.size.width / 2 + 60, 90, 40, 65)
        imgRightHand = UIImageView(frame:rectRightHand)
        imgRightHand.image = UIImage(named:"owl-login-arm-right")
        imgLogin.addSubview(imgRightHand)
        
        //登录框背景
        let vLogin =  UIView(frame:CGRectMake(15, 200, mainSize.width - 30, 160))
        vLogin.layer.borderWidth = 0.5
        vLogin.layer.borderColor = UIColor.lightGrayColor().CGColor
        vLogin.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(vLogin)
        
        //猫头鹰左手(圆形的)
        let rectLeftHandGone = CGRectMake(mainSize.width / 2 - 100,
                                          vLogin.frame.origin.y - 22, 40, 40)
        imgLeftHandGone = UIImageView(frame:rectLeftHandGone)
        imgLeftHandGone.image = UIImage(named:"icon_hand")
        self.view.addSubview(imgLeftHandGone)
        
        //猫头鹰右手(圆形的)
        let rectRightHandGone = CGRectMake(mainSize.width / 2 + 62,
                                           vLogin.frame.origin.y - 22, 40, 40)
        imgRightHandGone = UIImageView(frame:rectRightHandGone)
        imgRightHandGone.image = UIImage(named:"icon_hand")
        self.view.addSubview(imgRightHandGone)
        
        //用户名输入框
        txtUser = UITextField(frame:CGRectMake(30, 30, vLogin.frame.size.width - 60, 44))
        txtUser.delegate = self
        txtUser.layer.cornerRadius = 5
        txtUser.layer.borderColor = UIColor.lightGrayColor().CGColor
        txtUser.layer.borderWidth = 0.5
        txtUser.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
        txtUser.leftViewMode = UITextFieldViewMode.Always
        
        //用户名输入框左侧图标
        let imgUser =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
        imgUser.image = UIImage(named:"iconfont-user")
        txtUser.leftView!.addSubview(imgUser)
        vLogin.addSubview(txtUser)
        
        //密码输入框
        txtPwd = UITextField(frame:CGRectMake(30, 90, vLogin.frame.size.width - 60, 44))
        txtPwd.delegate = self
        txtPwd.layer.cornerRadius = 5
        txtPwd.layer.borderColor = UIColor.lightGrayColor().CGColor
        txtPwd.layer.borderWidth = 0.5
        txtPwd.secureTextEntry = true
        txtPwd.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
        txtPwd.leftViewMode = UITextFieldViewMode.Always
        
        //密码输入框左侧图标
        let imgPwd =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
        imgPwd.image = UIImage(named:"iconfont-password")
        txtPwd.leftView!.addSubview(imgPwd)
        vLogin.addSubview(txtPwd)
    }
    
    //输入框获取焦点开始编辑
    func textFieldDidBeginEditing(textField:UITextField)
    {
        //如果当前是用户名输入
        if textField.isEqual(txtUser){
            if (showType != LoginShowType.PASS)
            {
                showType = LoginShowType.USER
                return
            }
            showType = LoginShowType.USER
            
            //播放不遮眼动画
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.imgLeftHand.frame = CGRectMake(
                    self.imgLeftHand.frame.origin.x - self.offsetLeftHand,
                    self.imgLeftHand.frame.origin.y + 30,
                    self.imgLeftHand.frame.size.width, self.imgLeftHand.frame.size.height)
                self.imgRightHand.frame = CGRectMake(
                    self.imgRightHand.frame.origin.x + 48,
                    self.imgRightHand.frame.origin.y + 30,
                    self.imgRightHand.frame.size.width, self.imgRightHand.frame.size.height)
                self.imgLeftHandGone.frame = CGRectMake(
                    self.imgLeftHandGone.frame.origin.x - 70,
                    self.imgLeftHandGone.frame.origin.y, 40, 40)
                self.imgRightHandGone.frame = CGRectMake(
                    self.imgRightHandGone.frame.origin.x + 30,
                    self.imgRightHandGone.frame.origin.y, 40, 40)
            })
        }
            //如果当前是密码名输入
        else if textField.isEqual(txtPwd){
            if (showType == LoginShowType.PASS)
            {
                showType = LoginShowType.PASS
                return
            }
            showType = LoginShowType.PASS
            
            //播放遮眼动画
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.imgLeftHand.frame = CGRectMake(
                    self.imgLeftHand.frame.origin.x + self.offsetLeftHand,
                    self.imgLeftHand.frame.origin.y - 30,
                    self.imgLeftHand.frame.size.width, self.imgLeftHand.frame.size.height)
                self.imgRightHand.frame = CGRectMake(
                    self.imgRightHand.frame.origin.x - 48,
                    self.imgRightHand.frame.origin.y - 30,
                    self.imgRightHand.frame.size.width, self.imgRightHand.frame.size.height)
                self.imgLeftHandGone.frame = CGRectMake(
                    self.imgLeftHandGone.frame.origin.x + 70,
                    self.imgLeftHandGone.frame.origin.y, 0, 0)
                self.imgRightHandGone.frame = CGRectMake(
                    self.imgRightHandGone.frame.origin.x - 30,
                    self.imgRightHandGone.frame.origin.y, 0, 0)
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//登录框状态枚举
enum LoginShowType {
    case NONE
    case USER
    case PASS
}