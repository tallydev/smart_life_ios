//
//  ModifyViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/8/3.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

protocol SendDelegate{
    func sendUserinfo(message : String, kek:String)
}

class ModifyViewController: UIViewController {
    
    var delegate : SendDelegate?
    
    var keyString = String()
    var keyone = String()
    var valueone = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modifyTextField.placeholder = valueone
        // 准备UI
        prepareUI()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 布局UI
        layoutUI()
    }
    
    private func prepareUI() {
        // 导航栏右边确认
        navigationItem.setRightBarButtonItem(UIBarButtonItem.init(title: "确认", style: UIBarButtonItemStyle.Bordered, target: self, action: #selector(ModifyViewController.changeValue)), animated: true)
        navigationItem.rightBarButtonItem?.tintColor = UIColor.orangeColor()
        
        view.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        // 添加子控件
        self.view.addSubview(modifyView)
        modifyView.addSubview(modifyTextField)
        self.view.addSubview(tipsLabel)
        
    }
    
    private func layoutUI() {
        modifyView.snp_makeConstraints { (make) in
            make.top.equalTo(68)
            make.left.equalTo(4)
            make.right.equalTo(-4)
            make.height.equalTo(40)
        }
        modifyTextField.snp_makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(21)
            make.right.equalTo(-21)
        }
        tipsLabel.snp_makeConstraints { (make) in
            make.top.equalTo(modifyTextField.snp_bottom).offset(4)
            make.centerX.equalTo(modifyTextField)
            make.left.equalTo(25)
            make.right.equalTo(-25)
        }
    }
    
    
    
    /// 
    lazy var modifyView:UIView = {
        let modifyView = UIView()
            modifyView.backgroundColor = UIColor.whiteColor()
        return modifyView
    }()
    lazy var modifyTextField: UITextField = {
        let modifyTextField = UITextField()
        modifyTextField.delegate = self
        modifyTextField.clearButtonMode = UITextFieldViewMode.WhileEditing
        modifyTextField.font = UIFont(name:"Helvetica", size:15)
        modifyTextField.textAlignment = NSTextAlignment.Left
        modifyTextField.backgroundColor = UIColor.whiteColor()
        
        return modifyTextField
    }()
    
    lazy var tipsLabel: UILabel = {
        let tipsLabel = UILabel()
            tipsLabel.text = "4-20个字符，可由中英文、数字、“_”、“-”组成"
            tipsLabel.textColor = UIColor.lightGrayColor()
            tipsLabel.font = UIFont(name: "Helvetica", size:12)
        return tipsLabel
    
    }()

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

extension ModifyViewController: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        NSLog("textField")
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder() //这个隐藏(放弃)虚拟键盘
        
        return true
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        modifyTextField.resignFirstResponder()
    }
    
    
    func changeValue() {
        userInfoChange(ModifyViewController(), bodyKey: keyString, bodyValue: modifyTextField.text!, forkey1: keyone)
        self.delegate?.sendUserinfo(modifyTextField.text!, kek: keyone)
        navigationController?.popViewControllerAnimated(true)
        MyInfoViewController().Center.postNotificationName(String(MyInfoViewController().classForCoder), object: true)
    }
    
}

