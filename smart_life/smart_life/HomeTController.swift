//
//  HomeController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/9.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import CountdownLabel
import MBProgressHUD
import Alamofire
import SwiftyJSON


//定义个全局变量  如果不是全局变量会报错
let pedonmeter:CMPedometer = CMPedometer()
var public_timer:NSTimer!

class HomeTController: UIViewController, CirCleViewDelegate , CountdownLabelDelegate, LTMorphingLabelDelegate{
    
    var scacle = 1.0
    
    var circleView: CirCleView!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    
    @IBOutlet weak var countdownLabel: CountdownLabel!
    
    @IBOutlet weak var HomePageScrollView: UIScrollView!
    @IBOutlet weak var View21: UIButton!
    @IBOutlet weak var View22: UIButton!
    @IBOutlet weak var View23: UIButton!
    @IBOutlet weak var View24: UIButton!
    @IBOutlet weak var View31: UIButton!
    @IBOutlet weak var View41: UIButton!
    @IBOutlet weak var View51: UIButton!
    @IBOutlet weak var View52: UIButton!
    @IBOutlet weak var View53: UIButton!
    @IBOutlet weak var View54: UIButton!
    @IBOutlet weak var View55: UIButton!
    @IBOutlet weak var View56: UIButton!
    @IBOutlet weak var View61: UIButton!
    @IBOutlet weak var View62: UIButton!
    @IBOutlet weak var View71: UIButton!
    @IBOutlet weak var View72: UIButton!
    @IBOutlet weak var View73: UIButton!
    @IBOutlet weak var View74: UIButton!
    @IBOutlet weak var View81: UIButton!
    @IBOutlet weak var View92: UIButton!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 布局UI
        layoutUI()
    }
    
    func layoutUI(){
        alertView.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(160*self.scacle).priorityLow()
            make.height.equalTo(160)
        }
    }
    
    func close(){
        //设置动画属性
        
        self.scacle = 1
        //告诉self.view约束需要更新
        self.view.setNeedsUpdateConstraints()
        //动画
        UIView.animateWithDuration(0.2) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    //视图约束更新
    override func updateViewConstraints() {
        self.alertView.snp_updateConstraints{ (make) -> Void in
            //放大尺寸（优先级低）
            make.bottom.equalTo(160 * self.scacle).priorityLow();
        }
        
        super.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIImageView.userInteractionEnabled = true
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)
        
        public_timer = NSTimer.scheduledTimerWithTimeInterval(15,target:self,selector:#selector(HomeTController.getStepsNumber),userInfo:nil,repeats:true)
        
        alertView.descriptionLabel.text = "即将上线，敬请期待！"
        alertView.descriptionLabel.textColor = UIColor.whiteColor()
        alertView.descriptionLabel.adjustsFontSizeToFitWidth = true
        
        alertView.deleteOrderBtn.addTarget(self, action: #selector(close), forControlEvents: .TouchUpInside)
        super.view.addSubview(alertView)
        
        //轮播图加载
        let imageArray: [UIImage!] = [UIImage(named: "banner_one.jpg"), UIImage(named: "banner_two.jpg")]
        self.circleView = CirCleView(frame: CGRectMake(0, 0, self.view.frame.size.width, 220), imageArray: imageArray)
        circleView.backgroundColor = UIColor.orangeColor()
        circleView.delegate = self
        self.HomePageScrollView.addSubview(circleView)
        
        //倒计时组件设置
        let fromDate   = NSDate()
        countdownLabel.setCountDownTime(fromDate, minutes:1440)
        
        countdownLabel.addTime(60*60)
        countdownLabel.textColor = UIColor.orangeColor()
        countdownLabel.font = UIFont(name: "Courier", size: 30)
        countdownLabel.animationType = .Sparkle
        countdownLabel.delegate = self
        countdownLabel.start()
        
        setBtnStyle()
        
        setAction()
        
        // Do any additional setup after loading the view.
    }
    
    
    //轮播图网络图片加载设置；点击事件设置
    /********************************** Privite Methods ***************************************/
    //MARK:- Privite Methods
    func setImage(sender: UIButton) {
        //        circleView.imageArray = [UIImage(named: "first.jpg"), UIImage(named: "third.jpg")]
        circleView.urlImageArray = ["http://pic1.nipic.com/2008-09-08/200898163242920_2.jpg"]
    }
    
    /********************************** Delegate Methods ***************************************/
    //MARK:- Delegate Methods
    //MARK: CirCleViewDelegate Methods
    
    func clickCurrentImage(currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        HomePageScrollView.contentSize = CGSize.init(width: self.view.frame.width, height: 1848)
        HomePageScrollView.showsVerticalScrollIndicator = false;
        HomePageScrollView.showsHorizontalScrollIndicator = false;
        HomePageScrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    }
    
    
    lazy var alertView:alertFrameS = {
        let alertView = alertFrameS()
        
        return alertView
    }()
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension HomeTController {
    
    func orderAction() {
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.mode = MBProgressHUDMode.CustomView
        hud.customView = UIImageView(image: UIImage(named:"whiteLogo")!)
        
        hud.labelText = "即将上线，敬请期待！"
        
        //延迟隐藏
        hud.hide(true, afterDelay: 0.8)
        
        //        //设置动画属性
        //
        //        self.scacle = -0.25
        //        //告诉self.view约束需要更新
        //        self.view.setNeedsUpdateConstraints()
        //        //动画
        //        UIView.animateWithDuration(0.2) {
        //            self.view.layoutIfNeeded()
        //        }
    }
    
    func setBtnStyle(){
        View21.set(image: UIImage(named: "home-5"), title: "预约体检  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View21.tintColor = UIColor.init(patternImage: UIImage(named: "home-5")!)
        View22.set(image: UIImage(named: "home-6"), title: "健康报告  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View22.tintColor = UIColor.init(patternImage: UIImage(named: "home-6")!)
        
        View23.set(image: UIImage(named: "home-7"), title: "预约专家  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View23.tintColor = UIColor.init(patternImage: UIImage(named: "home-7")!)
        View24.set(image: UIImage(named: "home-34"), title: "", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View24.tintColor = UIColor.init(patternImage: UIImage(named: "home-34")!)
        
        View31.set(image: UIImage(named: "home-8"), title: "更多数据  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View31.tintColor = UIColor.init(patternImage: UIImage(named: "home-8")!)
        
        View41.set(image: UIImage(named: "home-9"), title: "活动详情  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View41.tintColor = UIColor.init(patternImage: UIImage(named: "home-9")!)
        
        View51.set(image: UIImage(named: "home-10"), title: "天气查询  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View51.tintColor = UIColor.init(patternImage: UIImage(named: "home-10")!)
        
        View52.set(image: UIImage(named: "home-12"), title: "违章查询  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View52.tintColor = UIColor.init(patternImage: UIImage(named: "home-12")!)
        View53.set(image: UIImage(named: "home-11"), title: "公积金      ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View53.tintColor = UIColor.init(patternImage: UIImage(named: "home-11")!)
        View54.set(image: UIImage(named: "home-13"), title: "医保卡      ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View54.tintColor = UIColor.init(patternImage: UIImage(named: "home-13")!)
        
        View55.set(image: UIImage(named: "home-14"), title: "预约办证  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View55.tintColor = UIColor.init(patternImage: UIImage(named: "home-14")!)
        View56.set(image: UIImage(named: "home-15"), title: "更多查询  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View56.tintColor = UIColor.init(patternImage: UIImage(named: "home-15")!)
        
        View61.set(image: UIImage(named: "home-16"), title: "远程控制  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View61.tintColor = UIColor.init(patternImage: UIImage(named: "home-16")!)
        View62.set(image: UIImage(named: "home-17"), title: "电子猫眼  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View62.tintColor = UIColor.init(patternImage: UIImage(named: "home-17")!)
        View71.set(image: UIImage(named: "home-21"), title: "IT学堂      ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View71.tintColor = UIColor.init(patternImage: UIImage(named: "home-21")!)
        View72.set(image: UIImage(named: "home-19"), title: "在线冲印  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View72.tintColor = UIColor.init(patternImage: UIImage(named: "home-19")!)
        View73.set(image: UIImage(named: "home-18"), title: "IT服务      ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View73.tintColor = UIColor.init(patternImage: UIImage(named: "home-18")!)
        
        View74.set(image: UIImage(named: "home-34"), title: "", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View74.tintColor = UIColor.init(patternImage: UIImage(named: "home-34")!)
        
        View81.set(image: UIImage(named: "home-20"), title: "我要预约  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View81.tintColor = UIColor.init(patternImage: UIImage(named: "home-20")!)
        View92.set(image: UIImage(named: "home-22"), title: "更多臻品  ", titlePosition: .Right, additionalSpacing: 15.0, state: .Normal)
        View92.tintColor = UIColor.init(patternImage: UIImage(named: "home-22")!)
    }
    
    
    func setImageAction(){
        let tapStepGestureRecognizer1 = UITapGestureRecognizer(target: self, action:#selector(HomeTController().tapSingleDid1))
        image1.addGestureRecognizer(tapStepGestureRecognizer1)
        
        let tapStepGestureRecognizer2 = UITapGestureRecognizer(target: self, action:#selector(HomeTController().tapSingleDid5))
        image2.addGestureRecognizer(tapStepGestureRecognizer2)
        
        let tapStepGestureRecognizer3 = UITapGestureRecognizer(target: self, action:#selector(HomeTController().tapSingleDid6))
        image3.addGestureRecognizer(tapStepGestureRecognizer3)
        
        let tapStepGestureRecognizer4 = UITapGestureRecognizer(target: self, action:#selector(HomeTController().tapSingleDid7))
        image4.addGestureRecognizer(tapStepGestureRecognizer4)
        
        let tapStepGestureRecognizer5 = UITapGestureRecognizer(target: self, action:#selector(HomeTController().tapSingleDid13))
        image5.addGestureRecognizer(tapStepGestureRecognizer5)
        
        let tapStepGestureRecognizer6 = UITapGestureRecognizer(target: self, action:#selector(HomeTController().tapSingleDid14))
        image6.addGestureRecognizer(tapStepGestureRecognizer6)
        
        let tapStepGestureRecognizer7 = UITapGestureRecognizer(target: self, action:#selector(HomeTController().tapSingleDid18))
        image7.addGestureRecognizer(tapStepGestureRecognizer7)
        
        let tapStepGestureRecognizer8 = UITapGestureRecognizer(target: self, action:#selector(HomeTController().tapSingleDid25))
        image8.addGestureRecognizer(tapStepGestureRecognizer8)
    }
    
    
    func setAction(){
        //视图点击跳转页面设置
        View21.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid1))
        View22.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid2))
        
        View23.addOnClickListener(self,action:#selector(HomeTController().orderAction))
        View24.addOnClickListener(self,action:#selector(HomeTController().orderAction))
        
        View31.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid5))
        View41.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid6))
        
        View51.addOnClickListener(self,action:#selector(HomeTController().orderAction))
        View52.addOnClickListener(self,action:#selector(HomeTController().orderAction))
        View53.addOnClickListener(self,action:#selector(HomeTController().orderAction))
        View54.addOnClickListener(self,action:#selector(HomeTController().orderAction))
        
        View55.addOnClickListener(self,action:#selector(HomeTController().orderAction))
        View56.addOnClickListener(self,action:#selector(HomeTController().orderAction))
        
        View61.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid13))
        View62.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid26))
        View71.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid14))
        View72.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid15))
        View73.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid16))
        
        View74.addOnClickListener(self,action:#selector(HomeTController().orderAction))
        
        View81.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid18))
        View92.addOnClickListener(self,action:#selector(HomeTController().tapSingleDid25))

    }
    
    //智慧健康
    func tapSingleDid1(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV11")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid2(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV12")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid3(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV13")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid4(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV14")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    //    健步达人
    func tapSingleDid5(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV21")
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    //    社区活动
    func tapSingleDid6(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV31")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    //    市政大厅
    func tapSingleDid7(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid8(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid9(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid10(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid11(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid12(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV41")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    //    智慧家居
    func tapSingleDid13(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV51")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid26(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV52")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    //    社区IT
    func tapSingleDid14(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV61")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid15(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV62")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid16(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV63")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func tapSingleDid17(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV64")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    //    新品上市
    func tapSingleDid18(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV71")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    //    限量销售
    func tapSingleDid25(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewControllerWithIdentifier("NAV81")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}


//定义带有点击事件响应的uiview控件
extension UIView {
    
    func addOnClickListener(target: AnyObject, action: Selector) {
        let gr = UITapGestureRecognizer(target: target, action: action)
        gr.numberOfTapsRequired = 1
        userInteractionEnabled = true
        addGestureRecognizer(gr)
    }
}

class UIViewEffect : UIView {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        backgroundColor = UIColor.orangeColor()
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            self.backgroundColor = UIColor.clearColor()
        })
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            self.backgroundColor = UIColor.whiteColor()
        })
    }
    
}


//定义可设置图片方位的按钮视图模型
extension UIButton {
    
    @objc func set(image anImage: UIImage?, title: String,
                         titlePosition: UIViewContentMode, additionalSpacing: CGFloat, state: UIControlState){
        self.imageView?.contentMode = .Center
        self.setImage(anImage, forState: state)
        
        positionLabelRespectToImage(title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .Center
        self.setTitle(title, forState: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode,
                                             spacing: CGFloat) {
        let imageSize = self.imageRectForContentRect(self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.sizeWithAttributes([NSFontAttributeName: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .Top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .Bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .Left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .Right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}

extension HomeTController {
    func getHome() {
        let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
        let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
        
        print(phone)
        print(token)
        
        let headers = ["Accept":"application/json",
                       "X-User-Phone": phone,
                       "X-User-Token": token]
        
        Alamofire.request(.GET, "http://elive.clfsj.com/home", headers: headers)
            .responseString { response in
                var json = JSON(data: response.data!)
                var info = json["newer"]
                
                if json["errors"].isEmpty == true && json["error"].isEmpty == true{
                    var endtime:String = info["end_time"].stringValue
                    dispatch_async(dispatch_get_main_queue(), {
//                        self.LineCharts(self.LineChart, dataArray: self.dataArray, timeLine: self.timeLine)
                    })
                }else{
                    
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = "添加昵称失败！"
                    //延迟隐藏
                    hud.hide(true, afterDelay: 0.8)
                    
                }
                
        }
    }
    func getStepsNumber() {
        //判断该设备是否支持计步功能
        if CMPedometer.isStepCountingAvailable(){
            //开始时间
            let startTime = getStartTime()
            
            let datef = NSDateFormatter()
            datef.dateFormat = "yyyy-MM-dd"
            let stringdate = datef.stringFromDate(getEndTime())
            //获取指定开始时间到当前时间的数据  参数 开始时间, 一个闭包
                        pedonmeter.startPedometerUpdatesFromDate(startTime, withHandler: { (pedometerData:CMPedometerData?, error:NSError?) -> Void in
                            if error != nil{
                                print("error:\(error)")
                            }
                            else{
                                print("步数===\(pedometerData!.numberOfSteps)")
                                print("距离===\(pedometerData!.distance)")
                                
                                let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
                                let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
                                
                                print(phone)
                                print(token)
                                
                                let headers = ["Accept":"application/json",
                                    "X-User-Phone": phone,
                                    "X-User-Token": token]
                                
                                let body = ["sport[date]":stringdate,
                                    "sport[count]":"\(pedometerData!.numberOfSteps)"]
                                
                                Alamofire.request(.POST, "http://elive.clfsj.com:8081/sports", headers: headers, parameters: body)
                                    .responseString { response in
                                        var json = JSON(data: response.data!)
                                        var info = json["items"]
                                        
                                        if json["errors"].isEmpty == true && json["error"].isEmpty == true{
                                            print("数据推送成功")
                                            
                                        }else{
                                            
                                            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                                            hud.mode = MBProgressHUDMode.Text
                                            hud.labelText = "添加昵称失败！"
                                            //延迟隐藏
                                            hud.hide(true, afterDelay: 0.8)
                                            
                                        }
                                        
                                }

                            }
                        })
            
        } else {
            print("there has something with CMPedometer")
        }
    }
    
    /**
     获取当前时区的时间
     */
    func getEndTime() -> NSDate
    {
        let date = NSDate()
        //转换成本地时区
        let numberOfDays = -8
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Hour, value: numberOfDays, toDate: date, options: NSCalendarOptions.init(rawValue: 0))
        
        let zone = NSTimeZone.systemTimeZone()
        let interval = zone.secondsFromGMTForDate(calculatedDate!)
        let nowDate = calculatedDate!.dateByAddingTimeInterval(Double(interval))
        print("获取当前时区的时间:\(nowDate)")
        return nowDate
    }

    
    /**
     获取开始时间 当天0时0分0秒
     */
    func getStartTime() -> NSDate
    {
        let datef = NSDateFormatter()
        datef.dateFormat = "yyyy-MM-dd"
        let stringdate = datef.stringFromDate(getEndTime())
        print("当天日期:\(stringdate)")
        let tdate = datef.dateFromString(stringdate)
        //获取本地时区的当天0时0分0秒
        let numberOfDays = -8
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Hour, value: numberOfDays, toDate: tdate!, options: NSCalendarOptions.init(rawValue: 0))
        
        let zone = NSTimeZone.systemTimeZone()
        let interval = zone.secondsFromGMTForDate(calculatedDate!)
        let nowday = calculatedDate!.dateByAddingTimeInterval(Double(interval))
        
        print("当天开始时间:\(nowday)")
        return nowday
    }

}
