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
    
}

//extension HomeTabCollectionViewCell {
//    
//    func setCollectionViewDataSourceDelegate<D: protocol<UITableViewDataSource, UITableViewDelegate>>(dataSourceDelegate: D, forItem item: Int) {
//        
//        homeTabCollection.delegate = dataSourceDelegate
//        homeTabCollection.dataSource = dataSourceDelegate
//        homeTabCollection.tag = item
//        homeTabCollection.setContentOffset(homeTabCollection.contentOffset, animated:false) // Stops collection view if it was scrolling.
//        homeTabCollection.reloadData()
//    }
//    
//    var collectionViewOffset: CGFloat {
//        set {
//            homeTabCollection.contentOffset.x = newValue
//        }
//        
//        get {
//            return homeTabCollection.contentOffset.x
//        }
//    }
//}
