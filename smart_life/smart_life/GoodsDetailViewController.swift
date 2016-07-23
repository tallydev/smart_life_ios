//
//  GoodsDetailViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/21.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

/// 已经添加进购物车的商品模型数组，初始化
var addGoodArray = [GoodModel]()

class GoodsDetailViewController: UIViewController, CirCleViewDelegate {
    
    var circleView: CirCleView!
    
    var goodCell = [GoodModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)
        
        //轮播图加载
        let imageArray: [UIImage!] = [UIImage(named: "banner1.png"), UIImage(named: "banner.png")]
        self.circleView = CirCleView(frame: CGRectMake(0, 0, self.view.frame.size.width, 220), imageArray: imageArray)
        circleView.backgroundColor = UIColor.orangeColor()
        circleView.delegate = self
        cicleContentView.addSubview(circleView)
        
        print("==============================")
         print(goodCell.first?.title)
        
        // 准备UI
        prepareUI()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addCountLabel.text = "\(addGoodArray.count)"
        self.tabBarItem.badgeValue = String(addGoodArray.count)
        // 布局UI
        layoutUI()
    }
    
    
    /**
     准备UI
     */
    private func prepareUI() {
        
        // 标题
        navigationItem.title = "商品详情"
        
        // 添加导航栏上的购物车按钮和已经添加的商品数量label
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)
        
        // 添加购物车按钮上的label
        self.navigationController!.navigationBar.addSubview(addCountLabel)
        self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
        
        // 导航栏左边返回
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(WaresDetailViewController.didTappedBackButton))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "left"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(GoodsDetailViewController.didTappedBackButton))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.orangeColor()
        
        
        // 添加按钮点击事件
        buyBtnView.orderBtn.addTarget(self, action: #selector(GoodsDetailViewController.didTappedAddCartButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        // view背景颜色
        view.backgroundColor = UIColor.init(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        titleLabel.text = goodCell.first?.title
        totalPriceLabel.text = goodCell.first?.desc
        
        // 添加子控件
        self.view.addSubview(detailView)
        self.view.addSubview(cicleContentView)
        detailView.addSubview(titleLabel)
        detailView.addSubview(totalPriceLabel)
        detailView.addSubview(detailLabel)
        self.view.addSubview(buyBtnView)
        
    }
    
    
    /**
     布局UI
     */
    private func layoutUI() {
        
        detailView.snp_makeConstraints { (make) in
            make.top.equalTo(292)
            make.left.equalTo(4)
            make.right.equalTo(-4)
            make.bottom.equalTo(-64)
        }
        
        cicleContentView.snp_makeConstraints { (make) in
            make.top.equalTo(68)
            make.left.right.equalTo(0)
            make.height.equalTo(220)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(10)
        }
        
        totalPriceLabel.snp_makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom).offset(10)
            make.left.right.equalTo(10)
        }
        
        buyBtnView.snp_makeConstraints { (make) in
            make.bottom.left.right.equalTo(0)
            make.height.equalTo(60)
        }
    }
    
    // MARK: - 懒加载
    /// detailView
    lazy var detailView: UIView = {
        let detailView = UIView()
        detailView.backgroundColor = UIColor.whiteColor()
        return detailView
    }()
    
    lazy var cicleContentView: UIView = {
        let cicleContentView = UIView()
        cicleContentView.backgroundColor = UIColor.whiteColor()
        return cicleContentView
    }()
    
    /// 标题Label
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        return titleLabel
    }()
    
    /// 价格Label
    lazy var totalPriceLabel: UILabel = {
        let totalPriceLabel = UILabel()
        
        totalPriceLabel.textColor = UIColor.orangeColor()
        
        return totalPriceLabel
    }()
    
    /// 描述Label
    lazy var detailLabel: UILabel = {
        let detailLabel = UILabel()
        
        return detailLabel
    }()
    
    /// 购买按钮视图
    lazy var buyBtnView: OrderBtn = {
        let buyBtnView = OrderBtn()
        return buyBtnView
    }()
    
    /// cartButton顶部购物车按钮
    lazy var cartButton: UIButton = {
        let carButton = UIButton(type: UIButtonType.Custom)
        carButton.setImage(UIImage(named: "cart"), forState: UIControlState.Normal)
        carButton.addTarget(self, action: #selector(GoodsDetailViewController.didTappedCarButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        carButton.sizeToFit()
        return carButton
    }()
    
    /// 已经添加进购物车的商品数量
    lazy var addCountLabel: UILabel = {
        let addCountLabel = UILabel(frame: CGRectMake(self.view.frame.size.width-25, 6, 15, 15))
        addCountLabel.backgroundColor = UIColor.whiteColor()
        addCountLabel.textColor = UIColor.redColor()
        addCountLabel.font = UIFont.boldSystemFontOfSize(11)
        addCountLabel.textAlignment = NSTextAlignment.Center
        addCountLabel.text = "\(addGoodArray.count)"
        addCountLabel.layer.cornerRadius = 7.5
        addCountLabel.layer.masksToBounds = true
        addCountLabel.layer.borderWidth = 1
        addCountLabel.layer.borderColor = UIColor.redColor().CGColor
        addCountLabel.hidden = true
        return addCountLabel
    }()
}

// MARK: - view上的一些事件处理
extension GoodsDetailViewController {
    
    /**
     当点击了购物车触发，modal到购物车控制器
     
     - parameter button: 购物车按钮
     */
    @objc private func didTappedCarButton(button: UIButton) {
        
        let shoppingCartVc = ShoppingCartViewController()
        
        // 传递商品模型数组
        shoppingCartVc.addGoodArray = addGoodArray
        
        // 模态出一个购物车控制器
        presentViewController(UINavigationController(rootViewController: shoppingCartVc), animated: true, completion: nil)
    }
    
    
    /**
     点击了购买按钮的事件
     
     - parameter button: 购买按钮
     */
    @objc private func didTappedAddCartButton(button: UIButton) {
        
        // 获取当前模型，添加到购物车模型数组
        let model = goodCell.first
            addGoodArray.append(model!)
        
        
        // 如果商品数大于0，显示购物车里的商品数量
        if addGoodArray.count > 0 {
            addCountLabel.hidden = false
        }
        
        print(Int(buyBtnView.numberLabel.text!))
        
        // 商品数量渐出
        let goodCountAnimation = CATransition()
        goodCountAnimation.duration = 0.25
        addCountLabel.text = "\(addGoodArray.count)"
        addCountLabel.layer.addAnimation(goodCountAnimation, forKey: nil)
        
        // 购物车抖动
        let cartAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        cartAnimation.duration = 0.25
        cartAnimation.fromValue = -5
        cartAnimation.toValue = 5
        cartAnimation.autoreverses = true
        cartButton.layer.addAnimation(cartAnimation, forKey: nil)
        
    }


    /**
    返回按钮
    */
    @objc private func didTappedBackButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @objc public func setImage(sender: UIButton) {
        //        circleView.imageArray = [UIImage(named: "first.jpg"), UIImage(named: "third.jpg")]
        circleView.urlImageArray = ["http://pic1.nipic.com/2008-09-08/200898163242920_2.jpg"]
    }
    
    @objc public func clickCurrentImage(currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }
}