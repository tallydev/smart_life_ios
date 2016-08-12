//
//  NewAddressViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/23.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

protocol SendMessageDelegate{
    func sendWord(message : AddressModel)
}

class NewAddressViewController: UIViewController {
    var delegate : SendMessageDelegate?
    
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
        navigationItem.title = "新建地址"
        
        // 导航栏左边返回
        navigationItem.leftBarButtonItem?.tintColor = UIColor.orangeColor()
        navigationItem.setRightBarButtonItem(UIBarButtonItem.init(title: "确认", style: UIBarButtonItemStyle.Bordered, target: self, action: #selector(NewAddressViewController.returnAddressView)), animated: true)
        
        // 导航栏右边确认
        
        view.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
        // 添加子控件
        self.view.addSubview(addressView)
        self.view.addSubview(pickerViewContent)
        pickerViewContent.addSubview(pickerView)
        pickerViewContent.addSubview(addressPicBtn)
        pickerViewContent.addSubview(addressNoPicBtn)
        
        
        addressView.addSubview(cellView1)
        addressView.addSubview(cellView2)
        addressView.addSubview(cellView3)
        addressView.addSubview(cellView4)
        
        cellView1.addSubview(orderNameLabel)
        cellView1.addSubview(orderTexeField)
        cellView2.addSubview(phoneNameLabel)
        cellView2.addSubview(phoneNumberTexeField)
        cellView3.addSubview(plotNameLabel)
        cellView3.addSubview(plotTexeField)
        cellView4.addSubview(addressNameLabel)
        cellView4.addSubview(addressTextFiled)
        
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
            make.height.equalTo(202)
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
        cellView3.snp_makeConstraints { (make) in
            make.top.equalTo(101)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(50.5)
        }
        cellView4.snp_makeConstraints { (make) in
            make.top.equalTo(151.5)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(50.5)
        }
        orderNameLabel.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }
        orderTexeField.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
            make.height.equalTo(50)
        }
        
        phoneNameLabel.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }
        phoneNumberTexeField.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
            make.height.equalTo(50)
        }

        plotNameLabel.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }
        plotTexeField.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
            make.height.equalTo(50)
        }
        addressNameLabel.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }
        addressTextFiled.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
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
    
    lazy var pickerViewContent: UIView = {
        let pickerViewContent = UIView()
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
    
    lazy var orderNameLabel: UILabel = {
        let orderNameLabel = UILabel()
        orderNameLabel.text = "收货人"
        orderNameLabel.font = UIFont(name:"Helvetica", size:14)
        orderNameLabel.textAlignment = NSTextAlignment.Left
        
        orderNameLabel.backgroundColor = UIColor.whiteColor()
        
        return orderNameLabel
    }()
    lazy var orderTexeField: UITextField = {
        let orderTexeField = UITextField()
        orderTexeField.placeholder = "请填写收货人姓名"
        orderTexeField.delegate = self
        orderTexeField.clearButtonMode = UITextFieldViewMode.WhileEditing
        orderTexeField.font = UIFont(name:"Helvetica", size:14)
        orderTexeField.textAlignment = NSTextAlignment.Right
        orderTexeField.backgroundColor = UIColor.whiteColor()
        return orderTexeField
    }()
    
    lazy var phoneNameLabel: UILabel = {
        let phoneNameLabel = UILabel()
        phoneNameLabel.text = "联系电话"
        phoneNameLabel.font = UIFont(name:"Helvetica", size:14)
        phoneNameLabel.textAlignment = NSTextAlignment.Left
        
        phoneNameLabel.backgroundColor = UIColor.whiteColor()
        
        return phoneNameLabel
    }()
    lazy var phoneNumberTexeField: UITextField = {
        let phoneNumberTexeField = UITextField()
        phoneNumberTexeField.placeholder = "请填写收货人手机"
        phoneNumberTexeField.delegate = self
        phoneNumberTexeField.clearButtonMode = UITextFieldViewMode.WhileEditing
        phoneNumberTexeField.font = UIFont(name:"Helvetica", size:14)
        phoneNumberTexeField.textAlignment = NSTextAlignment.Right
        phoneNumberTexeField.backgroundColor = UIColor.whiteColor()
        return phoneNumberTexeField
    }()
    
    lazy var plotNameLabel: UILabel = {
        let plotNameLabel = UILabel()
        plotNameLabel.text = "选择地区"
        plotNameLabel.font = UIFont(name:"Helvetica", size:14)
        plotNameLabel.textAlignment = NSTextAlignment.Left
        
        plotNameLabel.backgroundColor = UIColor.whiteColor()
        
        return plotNameLabel
    }()
    lazy var plotTexeField: UITextField = {
        let plotTexeField = UITextField()
        plotTexeField.tag = 1001
        plotTexeField.placeholder = "请选择所在物业小区"
        plotTexeField.delegate = self
        plotTexeField.font = UIFont(name:"Helvetica", size:14)
        plotTexeField.textAlignment = NSTextAlignment.Right
        plotTexeField.backgroundColor = UIColor.whiteColor()
        return plotTexeField
    }()
    
    lazy var addressNameLabel: UILabel = {
        let addressNameLabel = UILabel()
        addressNameLabel.text = "详细地址"
        addressNameLabel.font = UIFont(name:"Helvetica", size:14)
        addressNameLabel.textAlignment = NSTextAlignment.Left
        
        addressNameLabel.backgroundColor = UIColor.whiteColor()
        
        return addressNameLabel
    }()
    lazy var addressTextFiled: UITextField = {
        let addressTextFiled = UITextField()
        addressTextFiled.placeholder = "请详细门牌号xx幢xx单元xx室"
        addressTextFiled.clearButtonMode = UITextFieldViewMode.WhileEditing
        addressTextFiled.delegate = self
        addressTextFiled.font = UIFont(name:"Helvetica", size:14)
        addressTextFiled.textAlignment = NSTextAlignment.Right
        addressTextFiled.backgroundColor = UIColor.whiteColor()
        return addressTextFiled
    }()
    
    lazy var addressPicBtn: UIButton = {
        let addressPicBtn = UIButton(type:.System)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        addressPicBtn.setTitle("确定",forState:.Normal)
        addressPicBtn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        addressPicBtn.addTarget(self, action:#selector(NewAddressViewController.getPickerViewValue),
                         forControlEvents: UIControlEvents.TouchUpInside)
        return addressPicBtn
    }()
    lazy var addressNoPicBtn: UIButton = {
        let addressNoPicBtn = UIButton(type:.System)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        addressNoPicBtn.setTitle("取消",forState:.Normal)
        addressNoPicBtn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        addressNoPicBtn.addTarget(self, action:#selector(NewAddressViewController.closePickerViewValue),
                                forControlEvents: UIControlEvents.TouchUpInside)
        return addressNoPicBtn
    }()
}

extension NewAddressViewController: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        NSLog("textField")
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if textField.tag == 1001 {
            textField.resignFirstResponder() //这个隐藏(放弃)虚拟键盘
            //设置动画属性
            self.scacle = 0
            //告诉self.view约束需要更新
            self.view.setNeedsUpdateConstraints()
            //动画
            UIView.animateWithDuration(0.2) {
                self.view.layoutIfNeeded()
            }
            
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
            textField.resignFirstResponder() //这个隐藏(放弃)虚拟键盘
            //设置动画属性
            self.scacle = 0
            //告诉self.view约束需要更新
            self.view.setNeedsUpdateConstraints()
            //动画
            UIView.animateWithDuration(0.2) {
                self.view.layoutIfNeeded()
            }
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
    
    /**
     当点击了地址按钮
     */
    @objc private func payBtn(button: UIButton) {
        let urlString1 = "weixin://"
        let urlString = "alipay://"
        let url = NSURL(string: urlString)
        UIApplication.sharedApplication().openURL(url!)
    }
    
    @objc private func returnAddressView(){
        
        var dict = [String : AnyObject]()
        dict["userName"] = "\(orderTexeField.text)"
        dict["address"] = "\(plotTexeField.text)" +  "\(addressTextFiled.text)"
        dict["phone"] = "\(phoneNumberTexeField.text)"
        
        var addressM = AddressModel(dict:dict)
        // 字典转模型并将模型添加到模型数组中
         self.delegate?.sendWord(addressM)
        
        print(dict)
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    func closePickerViewValue(){
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

extension NewAddressViewController:UIPickerViewDelegate, UIPickerViewDataSource{
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
        let province:String = p["state"] as! String
        
        //获取选中的市
        let c = (p["cities"] as! NSArray)[cityIndex]
        let city:String = c["street"] as! String
        
        //获取选中的县（地区）
        var area:String = ""
        if (c["areas"] as! [String]).count > 0 {
            area = (c["areas"] as! [String])[areaIndex]
        }
        
        //拼接输出消息
        let message = "\(province) - \(city) - \(area)"
        
        plotTexeField.text = message
        //设置动画属性
        
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