//
//  AddressTableViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/22.
//  Copyright © 2016年 张留刚. All rights reserved.
//

class AddressTableViewController: UIViewController {
    
    // MARK: - 属性
    
    /// 商品模型数组，初始化
    private var addressArray = [AddressModel]()
    
    /// 商品列表cell的重用标识符
    private let addressCellIdentifier = "addressCell"
    
    
    // MARK: - view生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化模型数组，也就是搞点假数据。这里整10个模型
        for i in 1..<5 {
            var dict = [String : AnyObject]()
            dict["userName"] = "张三\(i + 1)"
            dict["address"] = "上海市松江区108\(i + 1)弄"
            dict["phone"] = "1851659123\(i + 1)"
            
            // 字典转模型并将模型添加到模型数组中
            addressArray.append(AddressModel(dict: dict))
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
        navigationItem.title = "收货地址"
        
        // 导航栏左边返回
        navigationItem.leftBarButtonItem?.tintColor = UIColor.orangeColor()
        // cell行高
        tableView.rowHeight = 80
        
        // 注册cell
        tableView.registerClass(AddressCell.self, forCellReuseIdentifier: addressCellIdentifier)
        
        // 添加子控件
        view.addSubview(tableView)
        view.addSubview(settleAccountsBottomView)
        settleAccountsBottomView.addSubview(buyButton)
    }
    
    /**
     布局UI
     */
    private func layoutUI() {
        
        // 约束子控件
        tableView.snp_makeConstraints { (make) -> Void in
            make.left.top.right.equalTo(0)
            make.bottom.equalTo(-49)
        }
        
        settleAccountsBottomView.snp_makeConstraints { (make) -> Void in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(49)
        }

        buyButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(settleAccountsBottomView)
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
    
    
    lazy var settleAccountsBottomView: UIView = {
        let settleAccountsBottomView = UIView()
        settleAccountsBottomView.backgroundColor = UIColor.whiteColor()
        return settleAccountsBottomView
    }()
    
    /// 底部付款按钮
    lazy var buyButton: UIButton = {
        let buyButton = UIButton(type: UIButtonType.Custom)
        buyButton.setTitle("新建收货地址", forState: UIControlState.Normal)
        buyButton.backgroundColor = UIColor.orangeColor()
        buyButton.layer.masksToBounds = true
        return buyButton
    }()
    
}


// MARK: - UITableViewDataSource, UITableViewDelegate数据、代理
extension AddressTableViewController: UITableViewDataSource, UITableViewDelegate {
    // 第section组有多少个cell,我们这里一共就一组。所以直接返回模型数组的长度
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressArray.count
    }
    
    // 创建每个cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 从缓存池创建cell，如果没有从缓存池创建成功就根据注册的cell重用标识符创建一个新的cell
        let cell = tableView.dequeueReusableCellWithIdentifier(addressCellIdentifier, forIndexPath: indexPath) as! AddressCell
        
        // 取消选中效果
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        // 为cell传递数据
        cell.addressModel = addressArray[indexPath.row]
        
        // 返回创建好的cell
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            addressArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
}