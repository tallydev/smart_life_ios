//
//  PayViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/23.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class PayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        navigationItem.title = "支付订单"
        
        // 导航栏左边返回
        navigationItem.leftBarButtonItem?.tintColor = UIColor.orangeColor()

        orderNumberLabel.text = "20160615"
            
        buyButton.addTarget(self, action: #selector(PayViewController.payBtn(_:)), forControlEvents: .TouchUpInside)
        
        view.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        // 添加子控件
        self.view.addSubview(addressView)
        self.view.addSubview(settleAccountsBottomView)
        
        addressView.addSubview(cellView1)
        addressView.addSubview(cellView2)
        addressView.addSubview(cellView3)
        
        cellView2.addSubview(priceLabel)
        cellView3.addSubview(payNameLabel)
        cellView2.addSubview(priceNameLabel)
        cellView1.addSubview(orderNameLabel)
        cellView1.addSubview(orderNumberLabel)
        cellView3.addSubview(weixinButton)
        cellView3.addSubview(alipayButton)
        
        settleAccountsBottomView.addSubview(buyButton)
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
            make.height.equalTo(250)
        }
        
        cellView1.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(60.5)
        }
        
        cellView2.snp_makeConstraints { (make) in
            make.top.equalTo(60.5)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(60.5)
        }
        
        cellView3.snp_makeConstraints { (make) in
            make.top.equalTo(121)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(0)
            
        }
        
        orderNameLabel.snp_makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        orderNumberLabel.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            make.left.equalTo(60)
            make.height.equalTo(60)
        }
        
        priceNameLabel.snp_makeConstraints { (make) in
            make.left.top.equalTo(0)
            make.height.equalTo(60)
            make.width.equalTo((self.view.frame.width-30)/2)
        }
        
        priceLabel.snp_makeConstraints { (make) in
            make.right.top.equalTo(0)
            make.height.equalTo(60)
            make.width.equalTo((self.view.frame.width-30)/2)
        }
        
        payNameLabel.snp_makeConstraints { (make) in
            make.top.right.left.equalTo(0)
            make.height.equalTo(60)
        }
        
        weixinButton.snp_makeConstraints { (make) in
            make.left.bottom.equalTo(0)
            make.top.equalTo(60)
            make.width.equalTo((self.view.frame.width-20)/2)
        }
        
        alipayButton.snp_makeConstraints { (make) in
            make.bottom.right.equalTo(0)
            make.top.equalTo(60)
            make.width.equalTo((self.view.frame.width-20)/2)
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
    
    lazy var addressView: UIView = {
        let addressView = UIView()
        addressView.backgroundColor = UIColor.whiteColor()
        
        return addressView
    }()
    
    lazy var cellView1: UIView = {
        let cellView1 = UIView()
        cellView1.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        
        return cellView1
    }()
    
    lazy var cellView2: UIView = {
        let cellView2 = UIView()
        cellView2.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        return cellView2
    }()
    
    lazy var cellView3: UIView = {
        let cellView3 = UIView()
        cellView3.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        return cellView3
    }()

    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = UIColor.darkGrayColor()
        priceLabel.textAlignment = NSTextAlignment.Right
        
        priceLabel.backgroundColor = UIColor.whiteColor()
        
        return priceLabel
    }()
    
    lazy var priceNameLabel: UILabel = {
        let priceNameLabel = UILabel()
        priceNameLabel.text = "订单金额"
        priceNameLabel.textAlignment = NSTextAlignment.Left
        priceNameLabel.backgroundColor = UIColor.whiteColor()
        return priceNameLabel
    }()
    lazy var orderNameLabel: UILabel = {
        let orderNameLabel = UILabel()
        orderNameLabel.text = "订单号:"
        orderNameLabel.textAlignment = NSTextAlignment.Left
        
        orderNameLabel.backgroundColor = UIColor.whiteColor()
        
        return orderNameLabel
    }()
    lazy var orderNumberLabel: UILabel = {
        let orderNumberLabel = UILabel()
        orderNumberLabel.textAlignment = NSTextAlignment.Left
        orderNumberLabel.backgroundColor = UIColor.whiteColor()
        return orderNumberLabel
    }()
    lazy var payNameLabel: UILabel = {
        let payNameLabel = UILabel()
        payNameLabel.text = "支付方式"
        payNameLabel.backgroundColor = UIColor.whiteColor()
        payNameLabel.textAlignment = NSTextAlignment.Left
        return payNameLabel
    }()
    
    lazy var weixinButton: UIButton = {
        let weixinButton = UIButton(type: UIButtonType.Custom)
        weixinButton.set(image: UIImage(named: "weixin"), title: "微信支付", titlePosition: .Right,
                 additionalSpacing: 10.0, state: .Normal)
        weixinButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal) //文字颜色
        weixinButton.backgroundColor = UIColor.whiteColor()
        weixinButton.layer.masksToBounds = true
        return weixinButton
    }()
    lazy var alipayButton: UIButton = {
        let alipayButton = UIButton(type: UIButtonType.Custom)
        alipayButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal) //文字颜色
        alipayButton.set(image: UIImage(named: "alipay"), title: "支付宝支付", titlePosition: .Right,
                         additionalSpacing: 10.0, state: .Normal)
        alipayButton.backgroundColor = UIColor.whiteColor()
        alipayButton.layer.masksToBounds = true
        return alipayButton
    }()

    lazy var settleAccountsBottomView: UIView = {
        let settleAccountsBottomView = UIView()
        settleAccountsBottomView.backgroundColor = UIColor.whiteColor()
        return settleAccountsBottomView
    }()

    /// 底部付款按钮
    lazy var buyButton: UIButton = {
        let buyButton = UIButton(type: UIButtonType.Custom)
        buyButton.setTitle("立即支付", forState: UIControlState.Normal)
        buyButton.backgroundColor = UIColor.orangeColor()
        buyButton.layer.masksToBounds = true
        return buyButton
    }()
}

extension PayViewController {
    
    func setValue(total: String){
        priceLabel.text = total
    }
    
    /**
     当点击了地址按钮
     */
    @objc private func payBtn(button: UIButton) {
        let urlString1 = "weixin://"
        let urlString = "alipay://"
        let url = NSURL(string: urlString)
        UIApplication.sharedApplication().openURL(url!)
    }
}