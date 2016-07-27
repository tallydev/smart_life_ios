//
//  GoodListCell.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/20.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

protocol GoodListCellDelegate: NSObjectProtocol {
    
    func goodListCell(cell: GoodListCell, iconView: UIImageView)
}

class GoodListCell: UITableViewCell {
    
    // MARK: - 属性
    /// 商品模型
    var goodModel: GoodModel? {
        didSet {
            
            if let iconName = goodModel?.iconName {
                iconView.image = UIImage(named: iconName)
            }
            
            if let title = goodModel?.title {
                titleLabel.text = title
            }
            
            if let desc = goodModel?.desc {
                descLabel.text = desc
            }
            
            // 已经点击的就禁用,这样做是防止cell重用
            addCartButton.enabled = !goodModel!.alreadyAddShoppingCart
            
            // 重新布局，会更新frame
            layoutIfNeeded()
            
        }
    }
    
    /// 代理属性
    weak var delegate: GoodListCellDelegate?
    
    /// 回调给控制器的商品图标
    var callBackIconView: UIImageView?
    
    // MARK: - 构造方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).CGColor
        // 准备UI
        prepareUI()
    }
    
    /**
     准备UI
     */
    private func prepareUI() {
        
        // 添加子控件
        contentView.addSubview(iconView)
        contentView.addSubview(addCartButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        
        // 约束子控件
        iconView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp_top).offset(10)
            make.left.equalTo(iconView.snp_right).offset(12)
        }
        
        descLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp_bottom).offset(12)
            make.left.equalTo(iconView.snp_right).offset(12)
        }
        
        addCartButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-20)
            make.bottom.equalTo(-15)
            make.width.equalTo(70)
            make.height.equalTo(25)
        }
        
    }
    
    // MARK: - 响应事件
    /**
     点击了查看详情按钮的事件
     
     - parameter button: 购买按钮
     */
    @objc private func didTappedAddCartButton(button: UIButton) {
        
        // 已经购买
        goodModel!.alreadyAddShoppingCart = true
        
        // 已经点击的就禁用
//        button.enabled = !goodModel!.alreadyAddShoppingCart
        
        // 通知代理对象，去处理后续操作
        delegate?.goodListCell(self, iconView: iconView)
    }
    
    // MARK: - 懒加载
    /// 商品缩略图
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.layer.cornerRadius = 0
        iconView.layer.masksToBounds = true
        return iconView
    }()
    
    /// 商品标题
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name:"Helvetica", size:14)
        return titleLabel
    }()
    
    /// 商品描述
    private lazy var descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.font = UIFont(name:"Helvetica", size:14)
        descLabel.textColor = UIColor.orangeColor()
        return descLabel
    }()
    
    /// 添加按钮
    private lazy var addCartButton: UIButton = {
        let addCartButton = UIButton(type:.System)
        addCartButton.backgroundColor = UIColor.orangeColor()
        addCartButton.layer.cornerRadius = 6
        addCartButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        addCartButton.titleLabel!.font = UIFont(name:"Helvetica", size:14)
        addCartButton.setTitle("查看详情", forState: UIControlState.Normal)
        
        // 添加按钮点击事件
        addCartButton.addTarget(self, action: #selector(GoodListCell.didTappedAddCartButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        return addCartButton
    }()
}
