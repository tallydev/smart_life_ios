//
//  ShoppingCartViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/15.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController,UITableViewDelegate,
UITableViewDataSource,UIGestureRecognizerDelegate {
    
    var tableView:UITableView?
    
    var ctrlnames:[String] = ["UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图","UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器","UITableView 表格视图"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建表视图
        self.tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame,
                                     style:UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        //绑定对长按的响应
        let longPress =  UILongPressGestureRecognizer(target:self,action:#selector(ShoppingCartViewController.tableviewCellLongPressed(_:)))
        //代理
        longPress.delegate = self
        longPress.minimumPressDuration = 1.0
        //将长按手势添加到需要实现长按操作的视图里
        self.tableView!.addGestureRecognizer(longPress)
    }
    
    //在本例中，只有一个分区
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlnames.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell
    {
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "SwiftCell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
            as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.ctrlnames[indexPath.row]
       
        //设置动画时间为0.25秒，xy方向缩放的最终值为1
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform=CATransform3DMakeScale(1, 1, 1)
        })
        
        return cell
    }
    
    //长按表格
    func tableviewCellLongPressed(gestureRecognizer:UILongPressGestureRecognizer)
    {
        if (gestureRecognizer.state == UIGestureRecognizerState.Ended)
        {
            print("UIGestureRecognizerStateEnded");
            //在正常状态和编辑状态之间切换
            if(self.tableView!.editing == false){
                self.tableView!.setEditing(true, animated:true)
            }
            else{
                self.tableView!.setEditing(false, animated:true)
            }
        }
    }
    
    //在编辑状态，可以拖动设置cell位置
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //移动cell事件
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath,
                   toIndexPath: NSIndexPath) {
        if fromIndexPath != toIndexPath{
            //获取移动行对应的值
            let itemValue:String = ctrlnames[fromIndexPath.row]
            //删除移动的值
            ctrlnames.removeAtIndex(fromIndexPath.row)
            //如果移动区域大于现有行数，直接在最后添加移动的值
            if toIndexPath.row > ctrlnames.count{
                ctrlnames.append(itemValue)
            }else{
                //没有超过最大行数，则在目标位置添加刚才删除的值
                ctrlnames.insert(itemValue, atIndex:toIndexPath.row)
            }
        }
    }
}