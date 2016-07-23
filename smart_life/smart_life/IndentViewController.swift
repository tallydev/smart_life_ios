//
//  IndentViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/22.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class IndentViewController: UIViewController {

    // MARK: - 属性
    
    /// 商品模型数组，初始化
    private var indentArray = [IndentCellModel]()
    
    /// 商品列表cell的重用标识符
    private let indentCellIdentifier = "IndentCell"
    
    
    // MARK: - view生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let picname = ["限量销售-22","限量销售-21","限量销售-21"]
        let pictitle = ["西双版纳生态无眼凤梨","天然放养土鸡蛋","西双版纳野生蜂蜜"]
        let picdesc = ["¥66.00","¥50.00","¥150.00"]
        let picNumber = ["X 1","X 3","X 5"]
        
        // 初始化模型数组，也就是搞点假数据。这里整10个模型
        for i in 0..<3 {
            var dict = [String : AnyObject]()
            dict["indentCellPic"] = picname[i]
            dict["indentGoodName"] = pictitle[i]
            dict["indentGoodPrice"] = picdesc[i]
            dict["indentGoodsNumber"] = picNumber[i]
            
            // 字典转模型并将模型添加到模型数组中
            indentArray.append(IndentCellModel(dict: dict))
        }
        
        // 准备UI
        prepareUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 布局UI
        layoutUI()
    }
    
    /**
     准备UI
     */
    private func prepareUI() {
        
        // 标题
        navigationItem.title = "确认订单"
        
        // 导航栏左边返回
        navigationItem.leftBarButtonItem?.tintColor = UIColor.orangeColor()
        // cell行高
        tableView.rowHeight = 100
        
        priceLabel.text = "合计: ¥ 180.00"
        
        userNameLabel.text = "Leo"
        userNumberLabel.text = "15216666666"
        addressLabel.text = "XX区XX街道XX（小区名称）XX栋XX单元XX室"

        buyButton.addTarget(self, action: #selector(IndentViewController.payBtn(_:)), forControlEvents: .TouchUpInside)
        
        // 注册cell
        tableView.registerClass(IndentCell.self, forCellReuseIdentifier: indentCellIdentifier)
        
        //隐藏滚动条
        self.tableView.showsVerticalScrollIndicator = false

        //去除单元格分隔线
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        view.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        // 添加子控件
        self.view.addSubview(tableView)
        self.view.addSubview(addressView)
        self.view.addSubview(settleAccountsBottomView)
        
        addressView.addSubview(locationIcon)
        addressView.addSubview(rightIcon)
        addressView.addSubview(userNameLabel)
        addressView.addSubview(addressLabel)
        addressView.addSubview(userNumberLabel)
        
        settleAccountsBottomView.addSubview(buyButton)
        settleAccountsBottomView.addSubview(priceLabel)
    }
    
    /**
     布局UI
     */
    private func layoutUI() {
        
        // 约束子控件
        addressView.snp_makeConstraints { (make) in
            make.top.equalTo(68)
            make.left.equalTo(4)
            make.right.equalTo(-4)
            make.height.equalTo(60)
        }
        
        locationIcon.snp_makeConstraints { (make) in
            make.top.equalTo(20)
            make.bottom.equalTo(-20)
            make.left.equalTo(20)
            make.width.equalTo(14)
        }
        
        rightIcon.snp_makeConstraints { (make) in
            make.centerY.equalTo(addressView)
            make.right.equalTo(-20)
            make.height.equalTo(16)
            make.width.equalTo(10)
        }
        
        addressLabel.snp_makeConstraints { (make) in
            make.height.equalTo(40)
            make.right.equalTo(-40)
            make.top.equalTo(20)
            make.left.equalTo(60)
        }
        
        userNameLabel.snp_makeConstraints { (make) in
            make.height.equalTo(20)
            make.top.equalTo(9)
            make.width.equalTo(60)
            make.left.equalTo(60)
        }
        
        userNumberLabel.snp_makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(0)
            make.left.equalTo(120)
        }
        
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(66)
            make.left.equalTo(2)
            make.right.equalTo(-2)
            make.bottom.equalTo(-49)
        }
        
        settleAccountsBottomView.snp_makeConstraints { (make) -> Void in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(49)
        }
        
        priceLabel.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(self.view.frame.width/2)
            make.height.equalTo(settleAccountsBottomView)
        }
        
        buyButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(self.view.frame.width/2)
            make.height.equalTo(settleAccountsBottomView)
        }
        
    }
    
    // MARK: - 懒加载
    /// tableView
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        // 指定数据源和代理
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    lazy var addressView: UIView = {
        let addressView = UIView()
        addressView.backgroundColor = UIColor.whiteColor()
        
        //定义一个UITapGestureRecognizer
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(IndentViewController.toAddress))
        
        //设置view可以点击
        
        addressView.userInteractionEnabled = true
        
        //给view添加事件
        
        addressView.addGestureRecognizer(tap)
        

        return addressView
    }()
    
    lazy var locationIcon: UIImageView = {
        let locationIcon = UIImageView()
        locationIcon.image = UIImage(named: "location_icon")
        return locationIcon
    }()
    
    lazy var rightIcon: UIImageView = {
        let rightIcon = UIImageView()
        rightIcon.image = UIImage(named: "right_icon")
        return rightIcon
    }()
    
    lazy var addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.textColor = UIColor.orangeColor()
        addressLabel.adjustsFontSizeToFitWidth=true
        addressLabel.font = UIFont(name:"Helvetica", size:14)
        addressLabel.numberOfLines=2
        addressLabel.textAlignment = NSTextAlignment.Left
        return addressLabel
    }()
    
    lazy var userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.textColor = UIColor.orangeColor()
        userNameLabel.font = UIFont(name:"Helvetica", size:15)
        userNameLabel.textAlignment = NSTextAlignment.Left
        return userNameLabel
    }()
    
    lazy var userNumberLabel: UILabel = {
        let userNumberLabel = UILabel()
        userNumberLabel.textColor = UIColor.orangeColor()
        userNumberLabel.font = UIFont(name:"Helvetica", size:14)
        userNumberLabel.textAlignment = NSTextAlignment.Left
        return userNumberLabel
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = UIColor.orangeColor()
        priceLabel.textAlignment = NSTextAlignment.Center
        return priceLabel
    }()
    
    lazy var settleAccountsBottomView: UIView = {
        let settleAccountsBottomView = UIView()
        settleAccountsBottomView.backgroundColor = UIColor.whiteColor()
        return settleAccountsBottomView
    }()
    
    /// 底部付款按钮
    lazy var buyButton: UIButton = {
        let buyButton = UIButton(type: UIButtonType.Custom)
        buyButton.setTitle("提交订单", forState: UIControlState.Normal)
        buyButton.backgroundColor = UIColor.orangeColor()
        buyButton.layer.masksToBounds = true
        return buyButton
    }()
    
}


// MARK: - UITableViewDataSource, UITableViewDelegate数据、代理
extension IndentViewController: UITableViewDataSource, UITableViewDelegate {
    // 第section组有多少个cell,我们这里一共就一组。所以直接返回模型数组的长度
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return indentArray.count
    }
    
    // 创建每个cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 从缓存池创建cell，如果没有从缓存池创建成功就根据注册的cell重用标识符创建一个新的cell
        let cell = tableView.dequeueReusableCellWithIdentifier(indentCellIdentifier, forIndexPath: indexPath) as! IndentCell
        
        // 取消选中效果
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        // 为cell传递数据
        cell.indentModel = indentArray[indexPath.row]
        
        // 返回创建好的cell
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            indentArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
}

extension IndentViewController {
    
    /**
     当点击了提交订单按钮
     */
    @objc private func payBtn(button: UIButton) {
        
        let PayVc = PayViewController()
        
        // 模态出一个地址控制器
        navigationController?.pushViewController(PayVc, animated: true);
    }
    
    @objc private func toAddress() {
        
        let AddressVc = AddressTableViewController()
        
        // 模态出一个地址控制器
        navigationController?.pushViewController(AddressVc, animated: true);
    }
}