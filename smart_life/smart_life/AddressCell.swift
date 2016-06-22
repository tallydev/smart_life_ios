//
//  AddressCell.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/22.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit



class AddressCell: UITableViewCell {
    
    // MARK: - 属性
    /// 商品模型
    var addressModel: AddressModel? {
        didSet {
            
            // 选中状态
            selectButton.selected = addressModel!.selected
            
            if let userName = addressModel?.userName {
                namedLabel.text = userName
            }
            
            if let address = addressModel?.address {
                addressLabel.text = address
            }
            
            if let phone = addressModel?.phone {
                phoneLabel.text = phone
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
        
        // 准备UI
        prepareUI()
    }
    
    /**
     准备UI
     */
    private func prepareUI() {
        
        // 添加子控件
        contentView.addSubview(selectButton)
        contentView.addSubview(addressView)
        addressView.addSubview(namedLabel)
        addressView.addSubview(addressLabel)
        addressView.addSubview(phoneLabel)
        addressView.addSubview(setBtn)
        
        
        // 约束子控件
        selectButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(12)
            make.centerY.equalTo(contentView.snp_centerY)
        }
        
        addressView.snp_makeConstraints { (make) in
            make.left.equalTo(50)
            make.top.right.bottom.equalTo(0)
            make.height.equalTo(contentView.snp_height)
        }
        
        namedLabel.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(5)
        }
        addressLabel.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.bottom.equalTo(-10)
        }
        phoneLabel.snp_makeConstraints { (make) in
            make.right.equalTo(-12)
            make.top.equalTo(5)
            
        }
        setBtn.snp_makeConstraints { (make) in
            make.right.equalTo(-12)
            make.bottom.equalTo(-10)
        }
        
    }
    
    // MARK: - 响应事件
    /**
     选中了按钮后触发
     
     - parameter button: 被选中的按钮
     */
    @objc private func didSelectedButton(button: UIButton) {
        
        // 选中
        button.selected = !button.selected
        addressModel?.selected = button.selected
        
        // 重新计算价格
//        delegate?.reCalculateTotalPrice()
    }
    
    // MARK: - 懒加载
    /// 选择按钮
    private lazy var selectButton: UIButton = {
        let selectButton = UIButton(type: UIButtonType.Custom)
        selectButton.setImage(UIImage(named: "check_n"), forState: UIControlState.Normal)
        selectButton.setImage(UIImage(named: "check_y"), forState: UIControlState.Selected)
        selectButton.addTarget(self, action: #selector(AddressCell.didSelectedButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        selectButton.sizeToFit()
        return selectButton
    }()
    
    // 地址的view
    private lazy var addressView: UIView = {
        let addressView = UIView()
        addressView.backgroundColor = UIColor.whiteColor()
        return addressView
    }()
    
    /// 收货人姓名
    private lazy var namedLabel: UILabel = {
        let namedLabel = UILabel()
        return namedLabel
    }()
    /// 收货地址
    private lazy var addressLabel: UILabel = {
        let addressLabel = UILabel()
        return addressLabel
    }()
    /// 收货人电话
    private lazy var phoneLabel: UILabel = {
        let phoneLabel = UILabel()
        return phoneLabel
    }()
    // 地址的view
    private lazy var setBtn: UIButton = {
        let setBtn = UIButton()
        setBtn.tintColor = UIColor.orangeColor()
        return setBtn
    }()
}