//
//  GoodsListTableViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/20.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import SnapKit

// 屏幕尺寸
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

class GoodsListTableViewController: UIViewController {
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - 属性
    /// 商品模型数组，初始化
    public var goodArray = [GoodModel]()
    
    /// 商品列表cell的重用标识符
    private let goodListCellIdentifier = "goodListCell"
    
    
    var GoodDetialArray = [GoodModel]()
    /// 贝塞尔曲线
    private var path: UIBezierPath?
    
    /// 自定义图层
    var layer: CALayer?
    
    // MARK: - view生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)
        
        // 提醒：这个方法中一般用于初始化控制器中的一些数据、添加子控件等。但是这个方法获取的frame并不一定准确，所以不建议在这个方法约束子控件
        
        // 初始化模型数组，也就是搞点假数据。这里整10个模型
        let name = ["限量销售-22","限量销售-21","限量销售-21"]
        let title = ["西双版纳生态无眼凤梨","天然放养土鸡蛋","西双版纳野生蜂蜜"]
        let desc = ["¥66.00（包邮）","¥50.00（包邮）","¥150.00（包邮）"]
        let detailDesc = ["<p>新鲜直达，每件5kg（5-6个）</p><p>热带雨林气候，光照充足<br>版纳古朴民风，无激素和催熟</p><p>温馨提示<br>1.人工采摘，大小个头不        一，以重量为准；<br>2.发货时间待定，待新鲜采摘后即刻发货；<br>3.鉴于水果保质特性，请收货当日去皮食用或者冰箱冷藏72小时内食用完毕。</p>",
                          "<p>儿童老人首选每件20枚</p><p>自然低密度农林散养，自由觅食，纯粮补喂<br>公母同林，保持好心情<br>蛋壳厚实，微量元素丰富</p><p>温馨提示：<br>1.土鸡蛋整体偏小，食量大小不一，产蛋大小不一；<br>2.散养鸡大多三五天才下一次蛋，供应商尽早发货；<br>3.冰箱冷藏30天内请食用完毕。</p>",
                          "<p>（一年一季）每件500克</p><p>深山野生原蜜珍酿<br>清香浓郁，甜而不腻<br>采收季节：2016年春季</p><p>温馨提示：<br>1.存放于低于25℃的阴凉干燥处;<br>2.每日三次，每次1茶匙;<br>3.一周岁以下婴幼儿、糖尿病患者以及<br>4.蜂产品过敏者或其他禁忌者不建议食用；<br>5.忌与豆腐、韭菜同食，易导致腹泻。</p>"]
        let newPrice = ["66","50","150"]
        let oldPrice = ["80","70","180"]
        
        for i in 0..<3 {
            var dict = [String : AnyObject]()
            dict["iconName"] = name[i]
            dict["title"] = title[i]
            dict["desc"] = desc[i]
            dict["detailDesc"] = detailDesc[i]
            dict["newPrice"] = newPrice[i]
            dict["oldPrice"] = oldPrice[i]
            
            // 字典转模型并将模型添加到模型数组中
            goodArray.append(GoodModel(dict: dict))
        }
        
        
        // 准备子控件
        prepareUI()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 约束子控件
        layoutUI()
    }
    
    /**
     准备子控件方法，在这个方法中我们可以创建并添加子控件到view
     */
    private func prepareUI() {
        
        // 标题
        navigationItem.title = "限量销售"
        
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        //隐藏滚动条
        self.tableView.showsVerticalScrollIndicator = false
        
        
        view.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)

        // 添加tableView到控制器的view上
        view.addSubview(tableView)
        
        // 注册cell
        tableView.registerClass(GoodListCell.self, forCellReuseIdentifier: goodListCellIdentifier)
        
        //去除单元格分隔线
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        view.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
    }
    
    /**
     约束子控件的方法
     */
    private func layoutUI() {
        
        // 约束tableview，让它全屏显示。注意：这里我使用了第三方约束框架（SnapKit）。如果还不会使用，请学习
        tableView.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-2)
            make.left.equalTo(2)
            make.top.equalTo(2)
            make.bottom.equalTo(0)
        }
    }
    
    // MARK: - 懒加载
    /// tableView
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        // 指定数据源和代理
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate 数据源和代理方法
extension GoodsListTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 第section组有多少个cell,我们这里一共就一组。所以直接返回模型数组的长度
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodArray.count
    }
    
    // 创建每个cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 从缓存池创建cell，如果没有从缓存池创建成功就根据注册的cell重用标识符创建一个新的cell
        let cell = tableView.dequeueReusableCellWithIdentifier(goodListCellIdentifier, forIndexPath: indexPath) as! GoodListCell
        
        // 取消选中效果
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        // 为cell传递数据
        cell.goodModel = goodArray[indexPath.row]
        
        // 指定代理
        cell.delegate = self
        
        // 返回创建好的cell
        return cell
    }
}


// MARK: - GoodListCellDelegate代理方法
extension GoodsListTableViewController: GoodListCellDelegate {
    
    /**
     代理回调方法，当点击了cell上的购买按钮后触发
     
     - parameter cell:     被点击的cell
     - parameter iconView: 被点击的cell上的图标对象
     */
    func goodListCell(cell: GoodListCell, iconView: UIImageView) {
        
        guard let indexPath = tableView.indexPathForCell(cell) else {
            return
        }
        
        let GoodsDetailVc = GoodsDetailViewController()
        
        // 传递商品模型数组
        GoodsDetailVc.goodCell = [goodArray[indexPath.row]]
        
        // 模态出一个购物车控制器
        presentViewController(UINavigationController(rootViewController: GoodsDetailVc), animated: true, completion: nil)
//        let signUpVc = SignInViewController()
//        presentViewController(UINavigationController(rootViewController: signUpVc), animated: true, completion: nil)
    }
}