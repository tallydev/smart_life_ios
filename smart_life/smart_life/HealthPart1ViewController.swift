//
//  HealthPart1ViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class HealthPart1ViewController: UIViewController {
    var scacle = 1.0
    @IBAction func backBtn(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var orderBtn: UIButton!
    @IBAction func orderAction(sender: AnyObject) {
        //设置动画属性
        
        self.scacle = 0
        //告诉self.view约束需要更新
        self.view.setNeedsUpdateConstraints()
        //动画
        UIView.animateWithDuration(0.2) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    func sure(){
        orderBtn.enabled = false
        orderBtn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Disabled)
        orderBtn.setTitle("申请成功", forState: .Disabled)
        //设置动画属性
        
        self.scacle = 1
        //告诉self.view约束需要更新
        self.view.setNeedsUpdateConstraints()
        //动画
        UIView.animateWithDuration(0.2) {
            self.view.layoutIfNeeded()
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
    //视图约束更新
    override func updateViewConstraints() {
        self.alertView.snp_updateConstraints{ (make) -> Void in
            //放大尺寸（优先级低）
            make.bottom.equalTo(200 * self.scacle).priorityLow();
        }
        
        super.updateViewConstraints()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view1.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view1)
        
        
        alertView.descriptionLabel.text = "预约后由 < 慧生活 > 服务专员和您电话联系确认，请保持手机畅通。"
        alertView.descriptionLabel.textColor = UIColor.whiteColor()
        alertView.descriptionLabel.adjustsFontSizeToFitWidth = true
        
        alertView.orderSureBtn.addTarget(self, action: #selector(sure), forControlEvents: .TouchUpInside)
        alertView.deleteOrderBtn.addTarget(self, action: #selector(close), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(alertView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var alertView:alertFrame = {
        let alertView = alertFrame()
        
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
