//
//  HomeTabCollectionViewCell.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/17.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class HomeTabCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var homeTabLabel: UILabel!
    @IBOutlet weak var homeTabImage: UIImageView!
    @IBOutlet weak var homeTabView: UIView!
    @IBOutlet weak var homeTabCollection: UICollectionView!
    
    let wd = UIScreen.mainScreen().bounds.size.width //屏幕宽度
    
    let colletionCell :Int=2//几列
    
//    , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
//    let btn = [{["name":"预约体检","pic":"banner2.png"];
//        ["name":"健康报告","pic":"banner2.png"];
//        ["name":"预约专家","pic":"banner2.png"]},
//               {["name":"更多数据","pic":"banner2.png"]},
//               {["name":"活动详情","pic":"banner2.png"]},
//               {["name":"天气查询","pic":"banner2.png"];
//                ["name":"违章查询","pic":"banner2.png"];
//                ["name":"公积金","pic":"banner2.png"];
//                ["name":"医保卡","pic":"banner2.png"];
//                ["name":"预约办证","pic":"banner2.png"];
//                ["name":"更多查询","pic":"banner2.png"]},
//               {["name":"远程控制","pic":"banner2.png"];
//                ["name":"电子猫眼","pic":"banner2.png"]},
//               {["name":"学堂","pic":"banner2.png"];
//                ["name":"在线冲印","pic":"banner2.png"];
//                ["name":"服务","pic":"banner2.png"]},
//               {["name":"我要预约","pic":"banner2.png"]},
//               {["name":"更多臻品","pic":"banner2.png"]},]
    
    let courses = [
        ["name":"— 智慧健康 —","pic":"banner2.png"],
        ["name":"— 健身达人 —","pic":"banner3.png"],
        ["name":"— 社区活动 —","pic":"banner4.png"],
        ["name":"— 市政大厅 —","pic":"banner5.png"],
        ["name":"— 智慧家居 —","pic":"banner6.png"],
        ["name":"— 社区IT —","pic":"banner7.png"],
        ["name":"— 新品上市 —","pic":"banner8.png"],
        ["name":"— 限量销售 —","pic":"banner9.png"],
        ["name":"— 智慧健康 —","pic":"banner2.png"],
        ["name":"— 健身达人 —","pic":"banner3.png"],
        ["name":"— 社区活动 —","pic":"banner4.png"],
        ["name":"— 市政大厅 —","pic":"banner5.png"],
        ["name":"— 智慧家居 —","pic":"banner6.png"],
        ["name":"— 社区IT —","pic":"banner7.png"],
        ["name":"— 新品上市 —","pic":"banner8.png"],
        ["name":"— 限量销售 —","pic":"banner9.png"]
    ]


//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        homeTabCollection.delegate = self
//        
//        homeTabCollection.dataSource = self
//        
//        homeTabCollection.showsVerticalScrollIndicator = false
//        
//        homeTabView.addSubview(homeTabCollection)
//    }
//    
//    
//    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell{
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! HomeTabCollectionViewCell
//        
//        cell.backgroundColor=UIColor.whiteColor()
//        
//        
//        let item = courses[indexPath.row]
//        cell.homeTabLabel.text = item["name"]
//        cell.homeTabImage.image = UIImage(named:item["pic"]!)
//        
//        return cell
//        
//    }
//    
//    func numberOfSectionsInCollectionView(collectionView:UICollectionView) ->Int{
//        
//        //必加这句否则refresh完崩溃
//        
//        collectionView.collectionViewLayout.invalidateLayout()
//        
//        return 1
//        
//    }
//    
//    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) ->Int{
//        
//        return courses.count
//        
//    }
}
