//
//  ShoppingCartViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/15.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    // MARK: - 属性
    /// 已经添加进购物车的商品模型数组，初始化
    var addGoodArray: [GoodModel]? {
        didSet {
            
        }
    }
    
    var indentArray = [GoodModel]()
    
    /// 总金额，默认0.00
    var price: CFloat = 0.00
    
    /// 商品列表cell的重用标识符
    private let shoppingCarCellIdentifier = "shoppingCarCell"
    
    /// 商品列表header的重用标识符
    private let headerCellIdentifier = "headerCell"
    
    // MARK: - view生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view1.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view1)
        
        //隐藏滚动条
        self.tableView.showsVerticalScrollIndicator = false

        //去除单元格分隔线
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        view.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        // 准备UI
        prepareUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 布局UI
        layoutUI()
        
        // 重新计算价格
        reCalculateGoodCount()
    }
    
    /**
     准备UI
     */
    private func prepareUI() {
        
        // 标题
        navigationItem.title = "购物车"
        
        // 导航栏左边返回
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ShoppingCartViewController.didTappedBackButton))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "left"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ShoppingCartViewController.didTappedBackButton))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.orangeColor()
        
        // cell行高
        tableView.rowHeight = 100
        
        // 注册cell
        tableView.registerClass(ShoppingCartCell.self, forCellReuseIdentifier: shoppingCarCellIdentifier)
        
        // 添加子控件
        view.addSubview(tableView)
        view.addSubview(bottomView)
        view.addSubview(settleAccountsBottomView)
        bottomView.addSubview(selectButton)
        bottomView.addSubview(selectLabel)
        bottomView.addSubview(totalPriceLabel)
        settleAccountsBottomView.addSubview(buyButton)
        
        // 判断是否需要全选
        
        for model in addGoodArray! {
            if model.selected != true {
                // 只要有一个不等于就不全选
                selectButton.selected = false
                break
            }
        }
    }
    
    /**
     布局UI
     */
    private func layoutUI() {
        
        // 约束子控件
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(2)
            make.left.equalTo(2)
            make.right.equalTo(-2)
            make.bottom.equalTo(-98)
        }
        
        bottomView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(0)
            make.bottom.equalTo(-49)
            make.height.equalTo(49)
        }
        settleAccountsBottomView.snp_makeConstraints { (make) -> Void in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(49)
        }
        
        selectButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(14)
            make.width.height.equalTo(20)
            make.centerY.equalTo(bottomView.snp_centerY)
        }
        
        selectLabel.snp_makeConstraints { (make) in
            make.left.equalTo(44)
            make.centerY.equalTo(bottomView.snp_centerY)
        }
        
        totalPriceLabel.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-12)
            make.centerY.equalTo(bottomView.snp_centerY)
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
    
    /// 底部视图
    lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.whiteColor()
        return bottomView
    }()
    
    lazy var settleAccountsBottomView: UIView = {
        let settleAccountsBottomView = UIView()
        settleAccountsBottomView.backgroundColor = UIColor.whiteColor()
        return settleAccountsBottomView
    }()
    /// 底部多选、反选按钮
    lazy var selectButton: UIButton = {
        let selectButton = UIButton(type: UIButtonType.Custom)
        
        selectButton.setImage(UIImage(named: "check_n"), forState: UIControlState.Normal)
        selectButton.setImage(UIImage(named: "check_y"), forState: UIControlState.Selected)
//        selectButton.setTitle("  多选\\反选", forState: UIControlState.Normal)
//        selectButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
//        selectButton.titleLabel?.font = UIFont.systemFontOfSize(12)
        selectButton.addTarget(self, action: #selector(ShoppingCartViewController.didTappedSelectButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        selectButton.selected = true
        selectButton.sizeToFit()
        return selectButton
    }()
    
    lazy var selectLabel: UILabel = {
        let selectLabel = UILabel()
            selectLabel.text = "全选"
            selectLabel.textColor = UIColor.orangeColor()
        return selectLabel
    }()
    
    /// 底部总价Label
    lazy var totalPriceLabel: UILabel = {
        let totalPriceLabel = UILabel()
        let attributeText = NSMutableAttributedString(string: "合计：¥  \(self.price)0")
        attributeText.setAttributes([NSForegroundColorAttributeName : UIColor.orangeColor()], range: NSMakeRange(5, attributeText.length - 5))
        totalPriceLabel.textColor = UIColor.orangeColor()
        totalPriceLabel.attributedText = attributeText
        totalPriceLabel.sizeToFit()
        return totalPriceLabel
    }()
    
    /// 底部付款按钮
    lazy var buyButton: UIButton = {
        let buyButton = UIButton(type: UIButtonType.Custom)
        buyButton.setTitle("结算", forState: UIControlState.Normal)
        buyButton.addTarget(self, action: #selector(ShoppingCartViewController.goCheckCart(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        buyButton.backgroundColor = UIColor.orangeColor()
        buyButton.layer.masksToBounds = true
        return buyButton
    }()
    
}


// MARK: - UITableViewDataSource, UITableViewDelegate数据、代理
extension ShoppingCartViewController: UITableViewDataSource, UITableViewDelegate {
    /**
     布局UI
     */
    private func layoutHeaderUI(vw:UIView ,location_icon:UIImageView,name_label:UILabel,go_right:UIButton) {
        
        // 约束子控件
        print("i am in layoutHeaderUI")
        
        location_icon.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(12)
            make.centerY.equalTo(vw.snp_centerY)
        }
        
        name_label.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(36)
            make.centerY.equalTo(vw.snp_centerY)
        }
        
        go_right.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-12)
            make.height.equalTo(30)
            make.width.equalTo(20)
            make.centerY.equalTo(vw.snp_centerY)
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addGoodArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 从缓存池创建cell,不成功就根据重用标识符和注册的cell新创建一个
        let cell = tableView.dequeueReusableCellWithIdentifier(shoppingCarCellIdentifier, forIndexPath: indexPath) as! ShoppingCartCell
        
        // cell取消选中效果
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        // 指定代理对象
        cell.delegate = self
        
        // 传递模型
        cell.goodModel = addGoodArray?[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        reCalculateGoodCount()
    }
}

// MARK: - view上的一些事件处理
extension ShoppingCartViewController {
        
    /**
     当点击了地址按钮
    */
    @objc private func goHomeButton(button: UIButton) {
            
        let AddressVc = AddressTableViewController()
        // 模态出一个地址控制器
        navigationController?.pushViewController(AddressVc, animated: true);
    }
    
    /**
     当点击了结算按钮
     */
    @objc private func goCheckCart(button: UIButton) {
        
        let IndentVc = IndentViewController()
        var array = [GoodModel]()
        for model in addGoodArray! {
            // 只计算选中的商品
            if model.selected == true {
                array.append(model)
            }
        }
        
        IndentVc.setValue(array,total: (totalPriceLabel.attributedText?.string)!)
        // 模态出一个地址控制器
        navigationController?.pushViewController(IndentVc, animated: true);
        
    }
    
    /**
     返回按钮
     */
    @objc private func didTappedBackButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**
     重新计算商品数量
     */
    private func reCalculateGoodCount() {
        
        // 遍历模型
        for model in addGoodArray! {
            
            // 只计算选中的商品
            if model.selected == true {
                price += Float(model.count) * (model.newPrice! as NSString).floatValue
            }
        }
        
        // 赋值价格
        let attributeText = NSMutableAttributedString(string: "合计: ¥  \(self.price)0")
        attributeText.setAttributes([NSForegroundColorAttributeName : UIColor.orangeColor()], range: NSMakeRange(5, attributeText.length - 5))
        totalPriceLabel.attributedText = attributeText
        
        // 清空price
        price = 0
        
        // 刷新表格
        tableView.reloadData()
    }
    
    /**
     点击了多选按钮后的事件处理
     
     - parameter button: 多选按钮
     */
    @objc private func didTappedSelectButton(button: UIButton) {
        
        selectButton.selected = !selectButton.selected
        for model in addGoodArray! {
            model.selected = selectButton.selected
        }
        
        // 重新计算总价
        reCalculateGoodCount()
        
        // 刷新表格
        tableView.reloadData()
    }
}

// MARK: - JFShoppingCartCellDelegate代理方法
extension ShoppingCartViewController: ShoppingCartCellDelegate {
    
    /**
     当点击了cell中加、减按钮
     
     - parameter cell:       被点击的cell
     - parameter button:     被点击的按钮
     - parameter countLabel: 显示数量的label
     */
    func shoppingCartCell(cell: ShoppingCartCell, button: UIButton, countLabel: UILabel) {
        
        // 根据cell获取当前模型
        guard let indexPath = tableView.indexPathForCell(cell) else {
            return
        }
        
        // 获取当前模型，添加到购物车模型数组
        let model = addGoodArray![indexPath.row]
        
        if button.tag == 10 {
            
            if model.count < 1 {
                print("数量不能低于0")
                return
            }
            
            // 减
            model.count--
            countLabel.text = "\(model.count)"
        } else {
            // 加
            model.count++
            countLabel.text = "\(model.count)"
        }
        
        // 重新计算商品数量
        reCalculateGoodCount()
    }
    
    /**
     重新计算总价
     */
    func reCalculateTotalPrice() {
        reCalculateGoodCount()
    }
}