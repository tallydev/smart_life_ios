//
//  HealthPart2ViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import SwiftyJSON

class HealthPart2ViewController: UITableViewController {
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

//    var Airid = [String]()
//    var Airname = [String]()
//    var Airalarm = [String]()
//    var Airpoint1 = [String]()
//    var Airpoint2 = [String]()
    
    internal var reportArray = [Report]()
    var HeathItem = ["BMI","舒张压","收缩压","脉搏","血糖","胆固醇","尿酸"]
    var HeathResult = ["26.00","75mmHg","120mmHg","80次/分","7.3mmoL/L","2.2mmoL/L","323umoL/L"]
    var HeathRange = ["18.5-24.99","60-90mmHg","90-140mmHg","60-100次/分","3.9-6.1mmoL/L","3-5.2mmoL/L","男性:149-416umoL/L;女性:89-357umoL/L"]
    
    //    var airs: [Air] = airsData
    override func viewDidLoad() {
        
        getRport()
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)

//        self.tableView.rowHeight = 150
        super.viewDidLoad()
        //去除cell下划线
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        //隐藏滚动条
        self.tableView.showsVerticalScrollIndicator = false

        
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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reportArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 1.每当点中TableViewCell之后, 都会恢复原来的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row%2 == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("HealthPart21", forIndexPath: indexPath) as! HealthPart2TableViewCell
            cell.itemlabel.text = reportArray[indexPath.row].alias
            if reportArray[indexPath.row].value != "null" {
                cell.resultlabel.text = reportArray[indexPath.row].value
            }else{
                cell.resultlabel.text = "--"
            }
            cell.rangelabel.text = reportArray[indexPath.row].hint
            
            if reportArray[indexPath.row].state == "low" {
                cell.rangepic.image = UIImage(named: "健康报告-3")
            }else if reportArray[indexPath.row].state == "high" {
                //原始图片
                let srcImage = UIImage(named: "健康报告-3")!
                
                //翻转图片的方向
                var flipImageOrientation = (srcImage.imageOrientation.rawValue + 4) % 8
                flipImageOrientation += flipImageOrientation%2==0 ? 1 : -1
                //翻转图片
                let flipImage =  UIImage(CGImage:srcImage.CGImage!,
                                         scale:srcImage.scale,
                                         orientation:UIImageOrientation(rawValue: flipImageOrientation)!
                )
                
                //图片显示
                cell.rangepic.image = flipImage
            }
            
            cell.rangelabel.numberOfLines = 0    //显示label可以显示几行,为0表示不限制,多行显示
            cell.rangelabel.lineBreakMode = NSLineBreakMode.ByWordWrapping //NSLineBreakMode 有多个属性用来提供不同得显示格式.
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("HealthPart22", forIndexPath: indexPath) as! HealthPart2TableViewCell
            cell.itemlabel.text = reportArray[indexPath.row].alias
            if reportArray[indexPath.row].value != "null"  {
                cell.resultlabel.text = reportArray[indexPath.row].value
            }else{
                cell.resultlabel.text = "--"
            }
            cell.rangelabel.text = reportArray[indexPath.row].hint
            
            if reportArray[indexPath.row].state == "low" {
                cell.rangepic.image = UIImage(named: "健康报告-3")
            }else if reportArray[indexPath.row].state == "high" {
                //原始图片
                let srcImage = UIImage(named: "健康报告-3")!
                
                //翻转图片的方向
                var flipImageOrientation = (srcImage.imageOrientation.rawValue + 4) % 8
                flipImageOrientation += flipImageOrientation%2==0 ? 1 : -1
                //翻转图片
                let flipImage =  UIImage(CGImage:srcImage.CGImage!,
                                         scale:srcImage.scale,
                                         orientation:UIImageOrientation(rawValue: flipImageOrientation)!
                )
                
                //图片显示
                cell.rangepic.image = flipImage
            }
            
            cell.rangelabel.numberOfLines = 0    //显示label可以显示几行,为0表示不限制,多行显示
            cell.rangelabel.lineBreakMode = NSLineBreakMode.ByWordWrapping //NSLineBreakMode 有多个属性用来提供不同得显示格式.
            
            return cell
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "HealthSegue" {
            let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
            let DestViewController = segue.destinationViewController as! HealthPart3ViewController
            
            DestViewController.chartname = reportArray[indexPath.row].alias!
            DestViewController.name = reportArray[indexPath.row].name!
            DestViewController.navigationItem.title = reportArray[indexPath.row].alias
        }
    }
    
    func getRport() {
        
        let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
        let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
        
        print(phone)
        print(token)
        
        let headers = ["Accept":"application/json",
                       "X-User-Phone": phone,
                       "X-User-Token": token]
        
        Alamofire.request(.GET, "http://220.163.125.158:8081/reports", headers: headers)
            .responseString { response in
                var json = JSON(data: response.data!)
                var info = json["items"]
                
                if json["errors"].isEmpty == true && json["error"].isEmpty == true{
                    for i in 0..<info.count {
                        var dict = [String : AnyObject]()
                        dict["name"] = info[i]["name"].stringValue
                        dict["alias"] = info[i]["alias"].stringValue
                        dict["hint"] = info[i]["hint"].stringValue
                        dict["value"] = "\(info[i]["value"])"
                        dict["state"] = info[i]["state"].stringValue
                        
                        // 字典转模型并将模型添加到模型数组中
                        self.reportArray.append(Report(dict: dict))
                    }
                    self.tableView.reloadData()
                    
                }else{
                    
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = "添加昵称失败！"
                    //延迟隐藏
                    hud.hide(true, afterDelay: 0.8)
                    
                }
                
        }
        
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
