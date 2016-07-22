//
//  CommunityViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController {
    
    let alertView = alertFrame(frame: CGRect(x: 0.0, y: UIScreen.mainScreen().bounds.size.height-160, width: UIScreen.mainScreen().bounds.size.width, height: 160.0))

    @IBAction func backBtn(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var communityScrollView: UIScrollView!
    @IBOutlet weak var showImageView: UIImageView!
    
    @IBOutlet weak var orderView: OrderBtn!
    
    
    func orderAction() {
        
        self.alertView.descriptionLabel.text = "预约后由 < 慧生活 > 服务专员和您电话联系确认，请保持手机畅通。"
        self.alertView.descriptionLabel.textColor = UIColor.whiteColor()
        self.alertView.descriptionLabel.adjustsFontSizeToFitWidth = true
        
        self.alertView.orderSureBtn.addTarget(self, action: #selector(close), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(alertView)
    }
    
    func close(){
        self.alertView.removeFromSuperview()
        self.orderView.orderBtn.setTitle("预约成功", forState: .Disabled)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.orderView.orderBtn.addTarget(self, action: #selector(orderAction), forControlEvents: .TouchUpInside)
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        communityScrollView.contentSize = CGSize.init(width: self.view.frame.width, height: 1900)
        communityScrollView.showsVerticalScrollIndicator = false;
        communityScrollView.showsHorizontalScrollIndicator = false;
        communityScrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
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
