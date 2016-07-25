//
//  SignUpViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/24.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import Spring

class SignUpViewController: UIViewController {

    //选择器
    var pickerView:UIPickerView!
    
    //所以地址数据集合
    var addressArray = [[String: AnyObject]]()
    
    //选择的省索引
    var provinceIndex = 0
    //选择的市索引
    var cityIndex = 0
    //选择的县索引
    var areaIndex = 0
    
    var scacle = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //初始化数据
        let path = NSBundle.mainBundle().pathForResource("address", ofType:"plist")
        self.addressArray = NSArray(contentsOfFile: path!) as! Array
        
        //创建选择器
        pickerView=UIPickerView()
        //将dataSource设置成自己
        pickerView.dataSource=self
        //将delegate设置成自己
        pickerView.delegate=self
        
        pickerView.backgroundColor = UIColor.whiteColor()
        pickerView.tintColor = UIColor.orangeColor()
        
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
        navigationItem.title = "注册"

        
        view.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
//        pickerViewContent.hidden = true
        // 添加子控件
        self.view.addSubview(addressView)
        self.view.addSubview(dealBtn)
        self.view.addSubview(signInBtn)
        self.view.addSubview(pickerViewContent)
        
        
        pickerViewContent.addSubview(pickerView)
        pickerViewContent.addSubview(addressPicBtn)
        pickerViewContent.addSubview(addressNoPicBtn)
        
        
        addressView.addSubview(cellView1)
        addressView.addSubview(cellView2)
        addressView.addSubview(cellView3)
        addressView.addSubview(cellView4)
        addressView.addSubview(cellView5)
        addressView.addSubview(cellView6)
        
        cellView1.addSubview(orderNameView)
        cellView1.addSubview(orderTexeField)
        cellView2.addSubview(phoneNameView)
        cellView2.addSubview(phoneNumberTexeField)
        phoneNumberTexeField.addSubview(lineView)
        cellView2.addSubview(verifyBtn)
        //        cellView3.addSubview(plotBtn)
        cellView3.addSubview(plotNameView)
        cellView3.addSubview(plotTexeField)
        cellView4.addSubview(addressNameView)
        cellView4.addSubview(addressTextFiled)
        cellView5.addSubview(soloNameView)
        cellView5.addSubview(soloTextFiled)
        cellView6.addSubview(dealNameView)
        cellView6.addSubview(dealTextFiled)
        
        orderNameView.addSubview(orderNameLabel)
        phoneNameView.addSubview(phoneNameLabel)
        plotNameView.addSubview(plotNameLabel)
        addressNameView.addSubview(addressNameLabel)
        soloNameView.addSubview(soloNameLabel)
        dealNameView.addSubview(dealNameLabel)
        
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
            make.height.equalTo(303)
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
        cellView4.snp_makeConstraints { (make) in
            make.top.equalTo(101)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(50.5)
        }
        cellView5.snp_makeConstraints { (make) in
            make.top.equalTo(151.5)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(50.5)
        }
        cellView3.snp_makeConstraints { (make) in
            make.top.equalTo(202)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(50.5)
        }
        cellView6.snp_makeConstraints { (make) in
            make.top.equalTo(252.5)
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
            make.top.equalTo(10)
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
            make.width.equalTo(20)
            make.height.equalTo(12)
        }
        phoneNumberTexeField.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(-100)
            make.left.equalTo(60)
            make.height.equalTo(50)
        }
        lineView.snp_makeConstraints { (make) in
            make.centerY.equalTo(phoneNumberTexeField.snp_centerY)
            make.right.equalTo(0)
            make.width.equalTo(1)
            make.height.equalTo(30)
        }
        
        plotNameView.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }
        plotNameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(18)
            make.top.equalTo(16)
            make.width.equalTo(20)
            make.height.equalTo(16)
        }
        plotTexeField.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
            make.height.equalTo(50)
        }
        
        addressNameView.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }
        addressNameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(18)
            make.top.equalTo(16)
            make.width.equalTo(20)
            make.height.equalTo(16)
        }
        addressTextFiled.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
            make.height.equalTo(50)
        }
        
        soloNameView.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }
        soloNameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(18)
            make.top.equalTo(16)
            make.width.equalTo(20)
            make.height.equalTo(18)
        }
        soloTextFiled.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
            make.height.equalTo(50)
        }
        
        
        dealNameView.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }
        dealNameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(18)
            make.top.equalTo(16)
            make.width.equalTo(20)
            make.height.equalTo(16)
        }
        dealTextFiled.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
            make.height.equalTo(50)
        }
        
        
        verifyBtn.snp_makeConstraints { (make) in
            make.right.top.equalTo(0)
            make.width.equalTo(100)
            make.bottom.equalTo(-0.5)
        }
        signInBtn.snp_makeConstraints { (make) in
            make.top.equalTo(cellView6.snp_bottom).offset(25)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(45)
        }
        dealBtn.snp_makeConstraints { (make) in
            make.bottom.equalTo(-50)
            make.centerX.equalTo(signInBtn.snp_centerX)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        
        pickerViewContent.snp_makeConstraints { (make) in
            make.height.equalTo(200)
            make.left.right.equalTo(0)
            make.bottom.equalTo(200*self.scacle).priorityLow()
            make.bottom.greaterThanOrEqualTo(0)
        }
        addressPicBtn.snp_makeConstraints { (make) in
            make.right.top.equalTo(0)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        addressNoPicBtn.snp_makeConstraints { (make) in
            make.left.top.equalTo(0)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        pickerView.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(150)
        }
    }
    
    // MARK: - 懒加载
    
    lazy var addressView: UIView = {
        let addressView = UIView()
        addressView.backgroundColor = UIColor.whiteColor()
        
        return addressView
    }()
    
    lazy var pickerViewContent: SpringView = {
        let pickerViewContent = SpringView()
        pickerViewContent.backgroundColor = UIColor.whiteColor()
        
        return pickerViewContent
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
    lazy var cellView3: UIView = {
        let cellView3 = UIView()
        cellView3.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
        return cellView3
    }()
    lazy var cellView4: UIView = {
        let cellView4 = UIView()
        cellView4.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
        return cellView4
    }()
    lazy var cellView5: UIView = {
        let cellView5 = UIView()
        cellView5.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
        return cellView5
    }()
    lazy var cellView6: UIView = {
        let cellView6 = UIView()
        cellView6.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
        return cellView6
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
        phoneNameLabel.image = UIImage(named: "注册-4")
        return phoneNameLabel
    }()
    lazy var phoneNumberTexeField: UITextField = {
        let phoneNumberTexeField = UITextField()
        phoneNumberTexeField.placeholder = "请输入验证码"
        phoneNumberTexeField.delegate = self
        phoneNumberTexeField.clearButtonMode = UITextFieldViewMode.WhileEditing
        phoneNumberTexeField.font = UIFont(name:"Helvetica", size:14)
        phoneNumberTexeField.textAlignment = NSTextAlignment.Left
        phoneNumberTexeField.backgroundColor = UIColor.whiteColor()
        return phoneNumberTexeField
    }()
    
    lazy var addressNameView: UIView = {
        let addressNameView = UIView()
        addressNameView.backgroundColor = UIColor.whiteColor()
        return addressNameView
    }()
    lazy var addressNameLabel: UIImageView = {
        let addressNameLabel = UIImageView()
        addressNameLabel.image = UIImage(named: "注册-5")
        
        return addressNameLabel
    }()
    lazy var addressTextFiled: UITextField = {
        let addressTextFiled = UITextField()
        addressTextFiled.placeholder = "5-8位数字或字母"
        addressTextFiled.clearButtonMode = UITextFieldViewMode.WhileEditing
        addressTextFiled.delegate = self
        addressTextFiled.font = UIFont(name:"Helvetica", size:14)
        addressTextFiled.textAlignment = NSTextAlignment.Left
        addressTextFiled.backgroundColor = UIColor.whiteColor()
        return addressTextFiled
    }()
    
    lazy var soloNameView: UIView = {
        let soloNameView = UIView()
        soloNameView.backgroundColor = UIColor.whiteColor()
        return soloNameView
    }()
    lazy var soloNameLabel: UIImageView = {
        let soloNameLabel = UIImageView()
        soloNameLabel.image = UIImage(named: "注册-6")
        
        return soloNameLabel
    }()
    lazy var soloTextFiled: UITextField = {
        let soloTextFiled = UITextField()
        soloTextFiled.placeholder = "昵称"
        soloTextFiled.clearButtonMode = UITextFieldViewMode.WhileEditing
        soloTextFiled.delegate = self
        soloTextFiled.font = UIFont(name:"Helvetica", size:14)
        soloTextFiled.textAlignment = NSTextAlignment.Left
        soloTextFiled.backgroundColor = UIColor.whiteColor()
        return soloTextFiled
    }()
    
    
    lazy var plotNameView: UIView = {
        let plotNameView = UIView()
        plotNameView.backgroundColor = UIColor.whiteColor()
        return plotNameView
    }()
    lazy var plotNameLabel: UIImageView = {
        let plotNameLabel = UIImageView()
        plotNameLabel.image = UIImage(named: "注册-7")
        return plotNameLabel
    }()
    lazy var plotTexeField: UITextField = {
        let plotTexeField = UITextField()
        plotTexeField.tag = 1001
        plotTexeField.placeholder = "所在小区选择"
        plotTexeField.delegate = self
        plotTexeField.font = UIFont(name:"Helvetica", size:14)
        plotTexeField.textAlignment = NSTextAlignment.Left
        plotTexeField.backgroundColor = UIColor.whiteColor()
        return plotTexeField
    }()
    
    
    lazy var dealNameView: UIView = {
        let dealNameView = UIView()
        dealNameView.backgroundColor = UIColor.whiteColor()
        return dealNameView
    }()
    lazy var dealNameLabel: UIImageView = {
        let dealNameLabel = UIImageView()
        dealNameLabel.image = UIImage(named: "注册-8")
        
        return dealNameLabel
    }()
    lazy var dealTextFiled: UITextField = {
        let dealTextFiled = UITextField()
        dealTextFiled.placeholder = "请详细门牌号xx幢xx单元xx室"
        dealTextFiled.clearButtonMode = UITextFieldViewMode.WhileEditing
        dealTextFiled.delegate = self
        dealTextFiled.font = UIFont(name:"Helvetica", size:14)
        dealTextFiled.textAlignment = NSTextAlignment.Left
        dealTextFiled.backgroundColor = UIColor.whiteColor()
        return dealTextFiled
    }()
    
    lazy var lineView:UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        return lineView
    }()
    
    lazy var verifyBtn:UIButton = {
        let verifyBtn = UIButton(type:.System)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        verifyBtn.setTitle("获取验证码",forState:.Normal)
        verifyBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        verifyBtn.backgroundColor = UIColor.whiteColor()
        //        signInBtn.addTarget(self, action:#selector(SignUpViewController.getPickerViewValue),forControlEvents: UIControlEvents.TouchUpInside)
        return verifyBtn
    }()
    
    
    lazy var signInBtn:UIButton = {
        let signInBtn = UIButton(type:.System)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        signInBtn.setTitle("注 册",forState:.Normal)
        signInBtn.titleLabel?.font = UIFont(name:"Helvetica", size:20)
        signInBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signInBtn.backgroundColor = UIColor.orangeColor()
//        signInBtn.addTarget(self, action:#selector(SignUpViewController.getPickerViewValue),forControlEvents: UIControlEvents.TouchUpInside)
        return signInBtn
    }()
    
    lazy var dealBtn:UIButton = {
        let dealBtn = UIButton(type:.System)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        dealBtn.setTitle("服务条款",forState:.Normal)
        dealBtn.titleLabel?.font = UIFont(name:"Helvetica", size:12)
        dealBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        dealBtn.addTarget(self, action:#selector(SignUpViewController.getDealView),forControlEvents: UIControlEvents.TouchUpInside)
        return dealBtn
    }()
    
    lazy var addressPicBtn: UIButton = {
        let addressPicBtn = UIButton(type:.System)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        addressPicBtn.setTitle("确定",forState:.Normal)
        addressPicBtn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        addressPicBtn.addTarget(self, action:#selector(SignUpViewController.getPickerViewValue),
                                forControlEvents: UIControlEvents.TouchUpInside)
        return addressPicBtn
    }()
    lazy var addressNoPicBtn: UIButton = {
        let addressNoPicBtn = UIButton(type:.System)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        addressNoPicBtn.setTitle("取消",forState:.Normal)
        addressNoPicBtn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        addressNoPicBtn.addTarget(self, action:#selector(SignUpViewController.closePickerViewValue),
                                  forControlEvents: UIControlEvents.TouchUpInside)
        return addressNoPicBtn
    }()
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        NSLog("textField")
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if textField.tag == 1001 {
//            pickerViewContent.hidden = false
            //设置动画属性
            
            self.scacle = 0
            //告诉self.view约束需要更新
            self.view.setNeedsUpdateConstraints()
            //动画
            UIView.animateWithDuration(0.2) {
                self.view.layoutIfNeeded()
            }
            textField.resignFirstResponder() //这个隐藏(放弃)虚拟键盘
        }else{
            //设置动画属性
            
            self.scacle = 1
            //告诉self.view约束需要更新
            self.view.setNeedsUpdateConstraints()
            //动画
            UIView.animateWithDuration(0.2) {
                self.view.layoutIfNeeded()
            }
        }
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder() //这个隐藏(放弃)虚拟键盘
        
        return true
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.tag == 1001 {
            
            self.scacle = 0
            //告诉self.view约束需要更新
            self.view.setNeedsUpdateConstraints()
            //动画
            UIView.animateWithDuration(0.2) {
                self.view.layoutIfNeeded()
            }
            textField.resignFirstResponder() //这个隐藏(放弃)虚拟键盘
        }else{
            //设置动画属性
            
            self.scacle = 1
            //告诉self.view约束需要更新
            self.view.setNeedsUpdateConstraints()
            //动画
            UIView.animateWithDuration(0.2) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        addressTextFiled.resignFirstResponder()
        orderTexeField.resignFirstResponder()
        plotTexeField.resignFirstResponder()
        phoneNumberTexeField.resignFirstResponder()
    }
    
    //视图约束更新
    override func updateViewConstraints() {
        self.pickerViewContent.snp_updateConstraints{ (make) -> Void in
            //放大尺寸（优先级低）
            make.bottom.equalTo(200 * self.scacle).priorityLow();
        }
        
        super.updateViewConstraints()
    }
    
    
    @objc private func payBtn(button: UIButton) {
        let urlString1 = "weixin://"
        let urlString = "alipay://"
        let url = NSURL(string: urlString)
        UIApplication.sharedApplication().openURL(url!)
    }
    
    @objc private func returnAddressView(){
        navigationController?.popViewControllerAnimated(true)
    }
    
    func closePickerViewValue(){
        self.scacle = 1
        //告诉self.view约束需要更新
        self.view.setNeedsUpdateConstraints()
        //动画
        UIView.animateWithDuration(0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    func getDealView(){
        
        let DealViewVc = DealViewController()
        
        // 模态出一个购物车控制器
        navigationController?.pushViewController(DealViewVc, animated: true);
    }
}

extension SignUpViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    //设置选择框的列数为3列,继承于UIPickerViewDataSource协议
    func numberOfComponentsInPickerView( pickerView: UIPickerView) -> Int{
        return 3
    }
    
    //设置选择框的行数，继承于UIPickerViewDataSource协议
    func pickerView(pickerView: UIPickerView,numberOfRowsInComponent component: Int) -> Int{
        if component == 0 {
            return self.addressArray.count
        } else if component == 1 {
            let province = self.addressArray[provinceIndex]
            return province["cities"]!.count
        } else {
            let province = self.addressArray[provinceIndex]
            if let city = (province["cities"] as! NSArray)[cityIndex] as? [String: AnyObject] {
                return city["areas"]!.count
            } else {
                return 0
            }
        }
    }
    
    //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
        -> String? {
            if component == 0 {
                return self.addressArray[row]["state"] as? String
            }else if component == 1 {
                let province = self.addressArray[provinceIndex]
                return province["cities"]?[row]["street"] as? String
            }else {
                let province = self.addressArray[provinceIndex]
                let city = (province["cities"] as! NSArray)[cityIndex] as! [String: AnyObject]
                return (city["areas"] as! NSArray)[row] as? String
            }
    }
    
    //选中项改变事件（将在滑动停止后触发）
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //根据列、行索引判断需要改变数据的区域
        switch (component) {
        case 0:
            provinceIndex = row;
            cityIndex = 0;
            areaIndex = 0;
            pickerView.reloadComponent(1);
            pickerView.reloadComponent(2);
            pickerView.selectRow(0, inComponent: 1, animated: false);
            pickerView.selectRow(0, inComponent: 2, animated: false);
        case 1:
            cityIndex = row;
            areaIndex = 0;
            pickerView.reloadComponent(2);
            pickerView.selectRow(0, inComponent: 2, animated: false);
        case 2:
            areaIndex = row;
        default:
            break;
        }
    }
    
    //触摸按钮时，获得被选中的索引
    func getPickerViewValue(){
        //获取选中的省
        let p = self.addressArray[provinceIndex]
        let province = p["state"] as! String
        
        //获取选中的市
        let c = (p["cities"] as! NSArray)[cityIndex]
        let city = c["street"] as! String
        
        //获取选中的县（地区）
        var area = ""
        if (c["areas"] as! [String]).count > 0 {
            area = (c["areas"] as! [String])[areaIndex]
        }
        
        //拼接输出消息
        let message = "\(province) - \(city) - \(area)"
        
        plotTexeField.text = message
        
        self.scacle = 1
        //告诉self.view约束需要更新
        self.view.setNeedsUpdateConstraints()
        //动画
        UIView.animateWithDuration(0.2) {
            self.view.layoutIfNeeded()
        }
        //消息显示
        //        let alertController = UIAlertController(title: "您选择了",
        //                                                message: message, preferredStyle: .Alert)
        //        let cancelAction = UIAlertAction(title: "确定", style: .Cancel, handler: nil)
        //        alertController.addAction(cancelAction)
        //        self.presentViewController(alertController, animated: true, completion: nil)
    }
}