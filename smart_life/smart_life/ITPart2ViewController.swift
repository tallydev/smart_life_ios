//
//  ITPart2ViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/14.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class ITPart2ViewController: UIViewController {

    @IBAction func backBtn(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    let alertView = alertFrame(frame: CGRect(x: 0.0, y: UIScreen.mainScreen().bounds.size.height-160, width: UIScreen.mainScreen().bounds.size.width, height: 160.0))
    @IBOutlet weak var orderBtn: UIButton!
    @IBAction func orderAction(sender: AnyObject) {
        
        alertView.descriptionLabel.text = "预约后由 < 慧生活 > 服务专员和您电话联系确认，请保持手机畅通。"
        alertView.descriptionLabel.textColor = UIColor.whiteColor()
        alertView.descriptionLabel.adjustsFontSizeToFitWidth = true
        
        alertView.orderSureBtn.addTarget(self, action: #selector(close), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(alertView)
    }
    
    func close(){
        orderBtn.setTitle("预约成功", forState: .Disabled)
        alertView.removeFromSuperview()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)

        // Do any additional setup after loading the view.
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
