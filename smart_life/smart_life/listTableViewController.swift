//
//  listTableViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/21.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class listTableViewController: UITableViewController{
    // MARK: - 属性
    /// 商品模型数组，初始化
    private var goodArray = [GoodModel]()
    
    /// 商品列表cell的重用标识符
    private let goodListCellIdentifier = "goodListCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // 初始化模型数组，也就是搞点假数据。这里整10个模型
        for i in 1..<15 {
            var dict = [String : AnyObject]()
            dict["iconName"] = "banner\(i)"
            dict["title"] = "商品名称\(i + 1)"
            dict["desc"] = "这是第\(i + 1)个商品描述"
            dict["newPrice"] = "66\(i)"
            dict["oldPrice"] = "200\(i)"
            
            // 字典转模型并将模型添加到模型数组中
            goodArray.append(GoodModel(dict: dict))
        }
    }
    
    /**
     准备子控件方法，在这个方法中我们可以创建并添加子控件到view
     */
    private func prepareUI() {
        
        // 标题
        navigationItem.title = "商品列表"
        
        // 添加购物车按钮上的label
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
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
        return goodArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //从缓存池创建cell，如果没有从缓存池创建成功就根据注册的cell重用标识符创建一个新的cell
        let cell = tableView.dequeueReusableCellWithIdentifier(goodListCellIdentifier, forIndexPath: indexPath) as! GoodListCell
        
        // 取消选中效果
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        // 为cell传递数据
        cell.goodModel = goodArray[indexPath.row]
        
        // 返回创建好的cell
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
