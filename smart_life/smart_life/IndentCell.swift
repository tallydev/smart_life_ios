//
//  IndentTableViewCell.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/22.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class IndentCell: UITableViewCell {

    // MARK: - 属性
    /// 商品模型
    var indentModel: GoodModel? {
        didSet {
            
            if let indentCellPic = indentModel?.iconName {
                indentCellPicView.image = UIImage(named: indentCellPic)
            }
            
            if let indentGoodName = indentModel?.title {
                indentGoodNameLabel.text = indentGoodName
            }
            
            if let indentGoodPrice = indentModel?.newPrice {
                indentGoodPriceLabel.text = "¥"+indentGoodPrice
            }
            
            if let indentGoodsNumber = indentModel?.count {
                indentGoodsNumberLabel.text = "X"+String(indentGoodsNumber)
            }
            
            // 重新布局，会更新frame
            layoutIfNeeded()
            
        }
    }
    
    /// 代理属性
    
    
    // MARK: - 构造方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).CGColor
        addressView.backgroundColor = UIColor.whiteColor()
        // 准备UI
        prepareUI()
    }
    
    /**
     准备UI
     */
    private func prepareUI() {
        
        // 添加子控件
        contentView.addSubview(addressView)
        addressView.addSubview(indentGoodNameLabel)
        addressView.addSubview(indentGoodsNumberLabel)
        addressView.addSubview(indentGoodPriceLabel)
        addressView.addSubview(indentCellPicView)
        
        
        // 约束子控件
        addressView.snp_makeConstraints { (make) in
            make.left.top.equalTo(15)
            make.right.bottom.equalTo(-15)
        }
        
        indentGoodNameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(75)
            make.top.equalTo(0)
        }
        indentGoodsNumberLabel.snp_makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(20)
        }
        indentGoodPriceLabel.snp_makeConstraints { (make) in
            make.top.right.equalTo(0)
            
        }
        indentCellPicView.snp_makeConstraints { (make) in
            make.left.top.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(65)
        }
        
    }
    
    // 地址的view
    private lazy var addressView: UIView = {
        let addressView = UIView()
        addressView.backgroundColor = UIColor.whiteColor()
        return addressView
    }()
    
    //商品图片
    private lazy var indentCellPicView: UIImageView = {
        let indentCellPicView = UIImageView()
        
        return indentCellPicView
    }()
    
    /// 商品名称
    private lazy var indentGoodNameLabel: UILabel = {
        let indentGoodNameLabel = UILabel()
        indentGoodNameLabel.font = UIFont(name:"Helvetica", size:14)
        return indentGoodNameLabel
    }()
    /// 商品数量
    private lazy var indentGoodsNumberLabel: UILabel = {
        let indentGoodsNumberLabel = UILabel()
        indentGoodsNumberLabel.font = UIFont(name:"Helvetica", size:14)
        return indentGoodsNumberLabel
    }()
    /// 商品单价
    private lazy var indentGoodPriceLabel: UILabel = {
        let indentGoodPriceLabel = UILabel()
        indentGoodPriceLabel.font = UIFont(name:"Helvetica", size:14)
        return indentGoodPriceLabel
    }()
}