//
//  MyDataTableViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/18.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Spring

class MyDataTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var cellName = ["","头像","","昵称","登录手机","出生日期","性别","个性签名","身份证号码","收货地址","","变更绑定手机号","设置支付密码"]
    var keyFont = ["","user_info[avatar_attributes]","","user_info[nickname]","","user_info[birth]","user_info[sex]","user_info[slogan]","user_info[identity_card]","","","","user_info[pay_password]"]
    var keyone = ["","avatar","","nickname","","birth","sex","slogan","identity_card","","","","pay_password"]
//    var detailtext = ["","个人中心-29","","Loda","15316788888","1993-08-12","男","为啥设置","3101121199308127777","","","15316788888","支付密码用于手机商城中使用会员卡余额支付"]
    @IBOutlet var userInfoTableView: UITableView!
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(userInfo?.birth)
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)
        
        self.view.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
//        userInfoTableView.separatorInset = UIEdgeInsetsMake(10, 20, 0, 20)
//        userInfoTableView.layer.borderWidth = 4
//        userInfoTableView.layer.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).CGColor
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.reloadData()
        
        // 准备UI
        prepareUI()
        dateView.hidden = true
        shadeView.hidden = true
        sexView.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 布局UI
        layoutUI()
    }
    
    private func prepareUI() {
        self.view.addSubview(shadeView)
        self.view.addSubview(dateView)
        self.view.addSubview(sexView)
        sexView.addSubview(manBtn)
        sexView.addSubview(womenBtn)
        dateView.addSubview(datePicker)
        dateView.addSubview(sureBtn)
    }
    
    private func layoutUI() {
        userInfoTableView.delegate = self
        userInfoTableView.dataSource = self
        
        shadeView.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(-8)
            make.bottom.right.equalTo(8)
//            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(self.view.snp_height)
        }
        dateView.snp_makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.centerY.equalTo(self.view.snp_centerY)
            make.centerX.equalTo(self.view.snp_centerX)
            make.height.equalTo(self.view.frame.height*1/3)
        }
        
        sexView.snp_makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width/2)
            make.centerX.equalTo(self.view.snp_centerX)
            make.centerY.equalTo(self.view.snp_centerY)
            make.height.equalTo(140)
        }
        manBtn.snp_makeConstraints { (make) in
            make.top.equalTo(30)
            make.left.right.equalTo(0)
            make.width.equalTo(sexView.snp_width)
            make.height.equalTo(40)
        }
        womenBtn.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(manBtn.snp_bottom).offset(0)
            make.width.equalTo(sexView.snp_width)
            make.height.equalTo(40)
        }
        
        sureBtn.snp_makeConstraints { (make) in
            make.right.equalTo(-5)
            make.top.equalTo(5)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        datePicker.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.top.equalTo(sureBtn.snp_bottom).offset(10)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) ->CGFloat{
        if indexPath.row == 1 {
            return 98
        }else if indexPath.row == cellName.count-1 {
            return 70
        }else if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == cellName.count-3 {
            return 6
        }else{
            return 50
        }
        //return UITableViewAutomaticDimension
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellName.count
    }
//
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("myinfoCell1", forIndexPath: indexPath) as! UserAvatraTableViewCell
            cell.avatraLabel.text = cellName[indexPath.row]
            cell.userImage.imageFromURL((userInfo?.avatar)!,placeholder: (UIImage(named:"个人中心-29")?.roundCornersToCircle(border: 40,color: UIColor.orangeColor())!)!)
            
            let indent_large_enought_to_hidden:CGFloat = 10000
            cell.separatorInset = UIEdgeInsetsMake(0, indent_large_enought_to_hidden, 0, 0) // indent large engough for separator(including cell' content) to hidden separator
            cell.indentationWidth = indent_large_enought_to_hidden * -1 // adjust the cell's content to show normally
            cell.indentationLevel = 1
            
            return cell
        }else if indexPath.row == cellName.count-1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("myinfoCell4", forIndexPath: indexPath)
            
            
            cell.detailTextLabel?.text = "支付密码用于手机商城中使用会员卡余额支付"
            cell.textLabel?.text = cellName[indexPath.row]
            
            
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("myinfoCell2", forIndexPath: indexPath)
            
            if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == cellName.count-3 {
                cell.detailTextLabel?.text = ""
                cell.textLabel?.text = ""
                cell.accessoryType = UITableViewCellAccessoryType.None
                cell.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
                return cell
            }else if indexPath.row == 5 {
                cell.detailTextLabel?.text = userInfo?.birth
                cell.textLabel?.text = cellName[indexPath.row]
                return cell
            
            }else if indexPath.row == 3{
                cell.detailTextLabel?.text = userInfo?.nickname
                cell.textLabel?.text = cellName[indexPath.row]
                return cell
            }else if indexPath.row == 4{
                cell.detailTextLabel?.text = userInfo?.phone
                cell.textLabel?.text = cellName[indexPath.row]
                return cell
            }else if indexPath.row == 6{
                cell.detailTextLabel?.text = userInfo?.sex
                cell.textLabel?.text = cellName[indexPath.row]
                return cell
            }else if indexPath.row == 7{
                cell.detailTextLabel?.text = userInfo?.slogan
                cell.textLabel?.text = cellName[indexPath.row]
                return cell
            }else if indexPath.row == 8{
                cell.detailTextLabel?.text = userInfo?.identity_card
                cell.textLabel?.text = cellName[indexPath.row]
                return cell
            }else if indexPath.row == 9{
                cell.detailTextLabel?.text = ""
                cell.textLabel?.text = cellName[indexPath.row]
                return cell
            }else{
                cell.detailTextLabel?.text = userInfo?.phone
                cell.textLabel?.text = cellName[indexPath.row]
                return cell
            }
        }
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 1.每当点中TableViewCell之后, 都会恢复原来的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 3 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 12 {
            let ModifyVc = ModifyViewController()
            ModifyVc.navigationItem.title = "修改" + cellName[indexPath.row]
            ModifyVc.keyString = keyFont[indexPath.row]
            ModifyVc.keyone = keyone[indexPath.row]
            
            ModifyVc.delegate = self
            
            ModifyVc.valueone = userInfo?.valueForKey(keyone[indexPath.row]) as! String
            // 模态出一个修改信息控制器
            navigationController?.pushViewController(ModifyVc, animated: true);
        }else if indexPath.row == 1{
            //判断设置是否支持图片库
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                //初始化图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //指定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                //弹出控制器，显示界面
                self.presentViewController(picker, animated: true, completion: {
                    () -> Void in
                })
            }else{
                print("读取相册错误")
            }
            
        }else if indexPath.row == 5{
            //弹出遮罩层
            shadeView.hidden = false
            shadeView.duration = 1
            shadeView.animation = "fadeIn"
            shadeView.curve = "easeIn"
            shadeView.animate()
            //弹出选择框
            dateView.hidden = false
            dateView.duration = 1
            dateView.delay = 0
            dateView.animation = "slideDown"
            dateView.curve = "easeIn"
            dateView.animate()
        }else if indexPath.row == 6{
            //弹出遮罩层
            shadeView.hidden = false
            shadeView.duration = 1
            shadeView.animation = "fadeIn"
            shadeView.curve = "easeIn"
            shadeView.animate()
            //弹出选择框
            sexView.hidden = false
            sexView.duration = 1
            sexView.delay = 0
            sexView.animation = "slideDown"
            sexView.curve = "easeIn"
            sexView.animate()
        }else if indexPath.row == 11{
            
        }else if indexPath.row == 4{
            var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "修改提示"
            hud.detailsLabelText = "请通过修改绑定手机号进行修改！"
            //延迟隐藏
            hud.hide(true, afterDelay: 0.8)
        }else{
            
        }
    }
    
    //选择图片成功后代理
    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        //获取选择的原图
        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //等比例压缩图片大小／并剪切为圆形
        let width = 96 * UIScreen.mainScreen().scale
        let height = 96 * UIScreen.mainScreen().scale
        let pig = pickedImage.resize(CGSize(width: width, height: height))
        let pigc = pig?.roundCornersToCircle()
        
        //将选择的图片保存到Document目录下
        let fileManager = NSFileManager.defaultManager()
        let rootPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
                                                           .UserDomainMask, true)[0] as String
        let filePath = "\(rootPath)/news.png"
        let imageData = UIImageJPEGRepresentation(pigc!, 1.0)
        fileManager.createFileAtPath(filePath, contents: imageData, attributes: nil)
        
        //上传图片
        if (fileManager.fileExistsAtPath(filePath)){
            var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.labelText = "头像上传中。。。。"
            //背景渐变效果
            hud.dimBackground = true
            
            //取得NSURL
            let imageNSURL:NSURL = NSURL.init(fileURLWithPath: filePath)
            //            self.userAvatar.setImage(UIImage(contentsOfFile:filePath)?.roundCornersToCircle(border: 10, color: UIColor.clearColor()), forState: .Normal)
            
            //            print(imageData)
            
            let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
            let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
            
            let headers = ["Accept":"application/json",
                           "X-User-Phone": phone,
                           "X-User-Token": token]
            
            Alamofire.upload(.PUT, "http://elive.clfsj.com:8081/user_info",
                             // define your headers here
                headers: headers,
                multipartFormData: { multipartFormData in
                    
                    // import image to request
                    if let imageData = UIImageJPEGRepresentation(pigc!, 1.0) {
                        multipartFormData.appendBodyPart(data: imageData, name: "user_info[avatar_attributes][photo]", fileName: "news.png", mimeType: "image/png")
                    }
                }, // you can customise Threshold if you wish. This is the alamofire's default value
                encodingMemoryThreshold: Manager.MultipartFormDataEncodingMemoryThreshold,
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .Success(let upload, _, _):
                        upload.responseJSON { response in
                            print("++++++++++++++++++++++++")
                            var json = JSON(data: response.data!)
                            userInfo?.avatar = json["avatar"].stringValue
                            print(json["avatar"].stringValue)
                            //延迟隐藏
                            hud.hide(true)
                            self.tableView.reloadData()
                            MyInfoViewController().Center.postNotificationName(String(MyInfoViewController().classForCoder), object: true)
                        }
                    case .Failure(let encodingError):
                        print("============================")
                        print(encodingError)
                    }
            })
            
        }
        
        //图片控制器退出
        picker.dismissViewControllerAnimated(true, completion:nil)
    }
    
    
//    添加右滑出现多个自定义按钮并实现相应点击动作
//    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
//        let more = UITableViewRowAction(style: .Normal, title: "编辑") { action, index in
//            print("more button tapped")
//        }
//        more.backgroundColor = UIColor.lightGrayColor()
//        
//        let favorite = UITableViewRowAction(style: .Normal, title: "删除") { action, index in
//            print("favorite button tapped")
//        }
//        favorite.backgroundColor = UIColor.redColor()
//        
//        
//        return [favorite, more]
//    }
    
    
//    遮罩层

    lazy var shadeView:SpringView = {
        let shadeView = SpringView()
        shadeView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return shadeView
    }()
    
//    性别选择框
    lazy var sexView:SpringView = {
        let sexView = SpringView()
        sexView.backgroundColor = UIColor.whiteColor()
        sexView.layer.borderWidth = 1
        sexView.layer.borderColor = UIColor.lightGrayColor().CGColor
        sexView.layer.cornerRadius = 10
        return sexView
    }()
    lazy var manBtn:UIButton = {
        let manBtn = UIButton()
        manBtn.setTitle("男", forState: .Normal)
        manBtn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        manBtn.addTarget(self, action: #selector(MyDataTableViewController.male), forControlEvents: .TouchUpInside)
        return manBtn
    }()
    lazy var womenBtn:UIButton = {
        let womenBtn = UIButton()
        womenBtn.setTitle("女", forState: .Normal)
        womenBtn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        womenBtn.addTarget(self, action: #selector(MyDataTableViewController.female), forControlEvents: .TouchUpInside)
        return womenBtn
    }()
    
//    线条实现
    lazy var lineView:UIView = {
        let lineView = UIView()
        return lineView
    }()
    
//    日期选择器
    lazy var dateView:SpringView = {
        let dateView = SpringView()
        dateView.backgroundColor = UIColor.whiteColor()
        dateView.layer.borderWidth = 1
        dateView.layer.borderColor = UIColor.lightGrayColor().CGColor
        dateView.layer.cornerRadius = 10
        return dateView
    }()
    //懒加载datePicker组件
    lazy var datePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        //将日期选择器区域设置为中文，则选择器日期显示为中文
        datePicker.locale = NSLocale(localeIdentifier: "zh_CN")
        datePicker.datePickerMode = .Date
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var maxDate = dateFormatter.dateFromString("1900-01-01")
        var minDate = dateFormatter.dateFromString("2080-01-01")
        datePicker.maximumDate = maxDate
        datePicker.minimumDate = minDate
        datePicker.tintColor = UIColor.whiteColor()
        
        //注意：action里面的方法名后面需要加个冒号“：”
        datePicker.addTarget(self, action: #selector(MyDataTableViewController.dateChanged(_:)), forControlEvents: .ValueChanged)
        return datePicker
    }()
    
    lazy var sureBtn:UIButton = {
        let sureBtn = UIButton()
            sureBtn.setTitle("关闭", forState: .Normal)
            sureBtn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
            sureBtn.addTarget(self, action: #selector(MyDataTableViewController.closePick), forControlEvents: .TouchUpInside)
        return sureBtn
    }()

}

extension MyDataTableViewController {
    

    //日期选择器响应方法
    func dateChanged(datePicker : UIDatePicker){
        //更新提醒时间文本框
        let formatter = NSDateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy-MM-dd"
        let birth = formatter.stringFromDate(datePicker.date)
        userInfoChange(MyDataTableViewController(), bodyKey: "user_info[birth]", bodyValue: birth, forkey1: "birth")
        print(formatter.stringFromDate(datePicker.date))
    }
    //隐藏弹出框
    func closePick() {
        shadeView.hidden = true
        dateView.hidden = true
        dateView.duration = 1
        dateView.delay = 0
        dateView.animation = "fadeOut"
        shadeView.animation = "fadeOut"
        shadeView.animate()
        dateView.animate()
        self.tableView.reloadData()
    }
    func male(){
        shadeView.hidden = true
        sexView.hidden = true
        sexView.duration = 1
        sexView.delay = 0
        sexView.animation = "fadeOut"
        shadeView.animation = "fadeOut"
        shadeView.animate()
        sexView.animate()
        userInfo?.sex = "男"
        let sex = "male"
        userInfoChange(MyDataTableViewController(), bodyKey: "user_info[sex]", bodyValue: sex, forkey1: "sex")
        self.tableView.reloadData()
    }
    
    func female() {
        shadeView.hidden = true
        sexView.hidden = true
        sexView.duration = 1
        dateView.delay = 0
        sexView.animation = "fadeOut"
        shadeView.animation = "fadeOut"
        shadeView.animate()
        sexView.animate()
        userInfo?.sex = "女"
        let sex = "female"
        userInfoChange(MyDataTableViewController(), bodyKey: "user_info[sex]", bodyValue: sex, forkey1: "sex")
        self.tableView.reloadData()
    }
}

extension MyDataTableViewController: SendDelegate {
    
    func sendUserinfo(message:String, kek:String) {
        userInfo?.setValue(message, forKey: kek)
        userInfoTableView.reloadData()
    }
}


