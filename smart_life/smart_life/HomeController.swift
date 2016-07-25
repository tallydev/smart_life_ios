//
//  HomeController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/9.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import CountdownLabel

class HomeController: UIViewController, CirCleViewDelegate , CountdownLabelDelegate, LTMorphingLabelDelegate{
    
    var scacle = 1.0
    
    var circleView: CirCleView!
    @IBOutlet weak var countdownLabel: CountdownLabel!

    @IBOutlet weak var HomePageScrollView: UIScrollView!
    @IBOutlet weak var View21: UIViewEffect!
    @IBOutlet weak var View22: UIViewEffect!
    @IBOutlet weak var View23: UIViewEffect!
    @IBOutlet weak var View24: UIViewEffect!
    @IBOutlet weak var View31: UIViewEffect!
    @IBOutlet weak var View41: UIViewEffect!
    @IBOutlet weak var View51: UIViewEffect!
    @IBOutlet weak var View52: UIViewEffect!
    @IBOutlet weak var View53: UIViewEffect!
    @IBOutlet weak var View54: UIViewEffect!
    @IBOutlet weak var View55: UIViewEffect!
    @IBOutlet weak var View56: UIViewEffect!
    @IBOutlet weak var View61: UIViewEffect!
    @IBOutlet weak var View62: UIViewEffect!
    @IBOutlet weak var View71: UIViewEffect!
    @IBOutlet weak var View72: UIViewEffect!
    @IBOutlet weak var View73: UIViewEffect!
    @IBOutlet weak var View74: UIViewEffect!
    @IBOutlet weak var View81: UIViewEffect!
    @IBOutlet weak var View92: UIViewEffect!
    
    
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
        
        alertView.descriptionLabel.text = "即将上线，敬请期待！"
        alertView.descriptionLabel.textColor = UIColor.whiteColor()
        alertView.descriptionLabel.adjustsFontSizeToFitWidth = true
        
        alertView.deleteOrderBtn.addTarget(self, action: #selector(close), forControlEvents: .TouchUpInside)
        super.view.addSubview(alertView)
        
        //轮播图加载
        let imageArray: [UIImage!] = [UIImage(named: "banner1.png"), UIImage(named: "banner.png")]
        self.circleView = CirCleView(frame: CGRectMake(0, 20, self.view.frame.size.width, 220), imageArray: imageArray)
        circleView.backgroundColor = UIColor.orangeColor()
        circleView.delegate = self
        self.HomePageScrollView.addSubview(circleView)
        
        //倒计时组件设置
        let fromDate   = NSDate().dateByAddingTimeInterval(0)
        countdownLabel.setCountDownTime(fromDate, minutes:1440)

        countdownLabel.addTime(60*60)
        countdownLabel.textColor = UIColor.orangeColor()
        countdownLabel.font = UIFont(name: "Courier", size: 30)
        countdownLabel.animationType = .Sparkle
        countdownLabel.delegate = self
        countdownLabel.start()
        
        
        //视图点击跳转页面设置
        View21.addOnClickListener(self,action:#selector(HomeController().tapSingleDid1))
        View22.addOnClickListener(self,action:#selector(HomeController().tapSingleDid2))
        
        View23.addOnClickListener(self,action:#selector(HomeController().orderAction))
        View24.addOnClickListener(self,action:#selector(HomeController().orderAction))
        
        View31.addOnClickListener(self,action:#selector(HomeController().tapSingleDid5))
        View41.addOnClickListener(self,action:#selector(HomeController().tapSingleDid6))
        
        View51.addOnClickListener(self,action:#selector(HomeController().orderAction))
        View52.addOnClickListener(self,action:#selector(HomeController().orderAction))
        View53.addOnClickListener(self,action:#selector(HomeController().orderAction))
        View54.addOnClickListener(self,action:#selector(HomeController().orderAction))
        
        View55.addOnClickListener(self,action:#selector(HomeController().orderAction))
        View56.addOnClickListener(self,action:#selector(HomeController().orderAction))
        
        View61.addOnClickListener(self,action:#selector(HomeController().tapSingleDid13))
        View62.addOnClickListener(self,action:#selector(HomeController().tapSingleDid26))
        View71.addOnClickListener(self,action:#selector(HomeController().tapSingleDid14))
        View72.addOnClickListener(self,action:#selector(HomeController().tapSingleDid15))
        View73.addOnClickListener(self,action:#selector(HomeController().tapSingleDid16))
        
        View74.addOnClickListener(self,action:#selector(HomeController().orderAction))
        
        View81.addOnClickListener(self,action:#selector(HomeController().tapSingleDid18))
        View92.addOnClickListener(self,action:#selector(HomeController().tapSingleDid25))
        
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
        HomePageScrollView.contentSize = CGSize.init(width: self.view.frame.width, height: 1856)
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


extension HomeController {
    
    func orderAction() {
        
        //设置动画属性
        
        self.scacle = -0.25
        //告诉self.view约束需要更新
        self.view.setNeedsUpdateConstraints()
        //动画
        UIView.animateWithDuration(0.2) {
            self.view.layoutIfNeeded()
        }
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
    //    健身达人
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
