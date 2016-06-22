//
//  HomeTabBtnCollectionView.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/18.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class HomeTabBtnCollectionView: UIViewController {
    
    // MARK: - 属性
    
    /// 商品模型数组，初始化
    private var btns = [
        [
            ["name":"预约体检","pic":"banner2.png"],
            ["name":"健康报告","pic":"banner2.png"],
            ["name":"预约专家","pic":"banner2.png"]
        ],
        [
            ["name":"更多数据","pic":"banner2.png"]
        ],
        [
            ["name":"活动详情","pic":"banner2.png"]
        ],
        [
            ["name":"天气查询","pic":"banner2.png"],
            ["name":"违章查询","pic":"banner2.png"],
            ["name":"公积金","pic":"banner2.png"],
            ["name":"医保卡","pic":"banner2.png"],
            ["name":"预约办证","pic":"banner2.png"],
            ["name":"更多查询","pic":"banner2.png"]
        ],
        [
            ["name":"远程控制","pic":"banner2.png"],
            ["name":"电子猫眼","pic":"banner2.png"]
        ],
        [
            ["name":"学堂","pic":"banner2.png"],
            ["name":"在线冲印","pic":"banner2.png"],
            ["name":"服务","pic":"banner2.png"]
        ],
        [
            ["name":"我要预约","pic":"banner2.png"]
        ],
        [
            ["name":"更多臻品","pic":"banner2.png"]
        ]
    ]

    
    /// 商品列表cell的重用标识符
    private let homeTabBtnCollectionViewIdentifier = "homeTabBtnCollectionViewCell"
    
    
    var sourceArray: Array<AnyObject>!
    
    convenience init(btn: Array<AnyObject>) {
        self.init()
        sourceArray = btn
    }
    
    // MARK: - view生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
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

        // 注册cell
        colltionView.registerClass( HomeTabBtnCollectionViewCell.self, forCellWithReuseIdentifier: homeTabBtnCollectionViewIdentifier)
        
        // 添加子控件
        view.addSubview(colltionView)
    }
    
    /**
     布局UI
     */
    private func layoutUI() {
        
        // 约束子控件
        colltionView.snp_makeConstraints { (make) -> Void in
            make.left.top.right.equalTo(0)
            make.bottom.equalTo(-49)
        }
    }
    
    // MARK: - 懒加载
    /// tableView
    lazy var colltionView: UICollectionView = {
        let colltionView = UICollectionView()
        // 指定数据源和代理
        colltionView.dataSource = self
        colltionView.delegate = self
        
        return colltionView
    }()
}


// MARK: - UITableViewDataSource, UITableViewDelegate数据、代理
extension HomeTabBtnCollectionView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //返回多少个组
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    //返回多少个cell
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return btns.count
    }
    //返回自定义的cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("homeTabBtnCollectionViewCell", forIndexPath: indexPath) as! HomeTabBtnCollectionViewCell
        
        cell.btnIcon.image = UIImage(named: sourceArray[indexPath.row]["pic"])
        
        cell.btnName.text = sourceArray[indexPath.row]["name"]
        
        return cell
    }
}