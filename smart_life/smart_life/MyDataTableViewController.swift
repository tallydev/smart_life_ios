//
//  MyDataTableViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/18.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class MyDataTableViewController: UITableViewController {
    
    var cellName = ["","头像","","昵称","登录手机","出生日期","性别","个性签名","身份证号码","收货地址","","变更绑定手机号","设置支付密码"]
    var detailtext = ["","个人中心-29","","Loda","15316788888","1993-08-12","男","为啥设置","3101121199308127777","","","15316788888","支付密码用于手机商城中使用会员卡余额支付"]
    @IBOutlet var userInfoTableView: UITableView!
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)
        
        userInfoTableView.separatorInset = UIEdgeInsetsMake(10, 20, 0, 20)
        userInfoTableView.layer.borderWidth = 4
        userInfoTableView.layer.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).CGColor
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
            cell.userImage.image = UIImage(named: detailtext[indexPath.row])
            
            let indent_large_enought_to_hidden:CGFloat = 10000
            cell.separatorInset = UIEdgeInsetsMake(0, indent_large_enought_to_hidden, 0, 0) // indent large engough for separator(including cell' content) to hidden separator
            cell.indentationWidth = indent_large_enought_to_hidden * -1 // adjust the cell's content to show normally
            cell.indentationLevel = 1
            
            return cell
        }else if indexPath.row == cellName.count-1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("myinfoCell4", forIndexPath: indexPath)
            
            
            cell.detailTextLabel?.text = detailtext[indexPath.row]
            cell.textLabel?.text = cellName[indexPath.row]
            
            
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("myinfoCell2", forIndexPath: indexPath)
            
            if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == cellName.count-3 {
                cell.accessoryType = UITableViewCellAccessoryType.None
                cell.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
            }
            cell.detailTextLabel?.text = detailtext[indexPath.row]
            cell.textLabel?.text = cellName[indexPath.row]
            return cell
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
    }
    
//    添加右滑出现多个自定义按钮并实现相应点击动作
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .Normal, title: "编辑") { action, index in
            print("more button tapped")
        }
        more.backgroundColor = UIColor.lightGrayColor()
        
        let favorite = UITableViewRowAction(style: .Normal, title: "删除") { action, index in
            print("favorite button tapped")
        }
        favorite.backgroundColor = UIColor.redColor()
        
        
        return [favorite, more]
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
