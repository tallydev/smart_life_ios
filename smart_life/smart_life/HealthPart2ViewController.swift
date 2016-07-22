//
//  HealthPart2ViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class HealthPart2ViewController: UITableViewController {
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

//    var Airid = [String]()
//    var Airname = [String]()
//    var Airalarm = [String]()
//    var Airpoint1 = [String]()
//    var Airpoint2 = [String]()
    
    var HeathItem = ["BMI","舒张压","收缩压","脉搏","血糖","胆固醇","尿酸"]
    var HeathResult = ["26.00","75mmHg","120mmHg","80次/分","7.3mmoL/L","2.2mmoL/L","323umoL/L"]
    var HeathRange = ["18.5-24.99","60-90mmHg","90-140mmHg","60-100次/分","3.9-6.1mmoL/L","3-5.2mmoL/L","男性:149-416umoL/L;女性:89-357umoL/L"]
    
    //    var airs: [Air] = airsData
    override func viewDidLoad() {
        
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
        return HeathItem.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 1.每当点中TableViewCell之后, 都会恢复原来的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row%2 == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("HealthPart21", forIndexPath: indexPath) as! HealthPart2TableViewCell
            cell.itemlabel.text = HeathItem[indexPath.row]
            cell.resultlabel.text = HeathResult[indexPath.row]
            cell.rangelabel.text = HeathRange[indexPath.row]
            
            cell.rangelabel.numberOfLines = 0    //显示label可以显示几行,为0表示不限制,多行显示
            cell.rangelabel.lineBreakMode = NSLineBreakMode.ByWordWrapping //NSLineBreakMode 有多个属性用来提供不同得显示格式.
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("HealthPart22", forIndexPath: indexPath) as! HealthPart2TableViewCell
            cell.itemlabel.text = HeathItem[indexPath.row]
            cell.resultlabel.text = HeathResult[indexPath.row]
            cell.rangelabel.text = HeathRange[indexPath.row]
            
            cell.rangelabel.numberOfLines = 0    //显示label可以显示几行,为0表示不限制,多行显示
            cell.rangelabel.lineBreakMode = NSLineBreakMode.ByWordWrapping //NSLineBreakMode 有多个属性用来提供不同得显示格式.
            
            return cell
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "HealthSegue" {
            let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
            let DestViewController = segue.destinationViewController as! HealthPart3ViewController
            
            DestViewController.chartname = HeathItem[indexPath.row]
            DestViewController.navigationItem.title = HeathItem[indexPath.row]
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
