//
//  Model.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/27.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    var images : [UIImage] = []
    
    
    // Assemble an array of images to use for sample content for the collectionView
    func buildDataSource(){
        
        let image1 = UIImage(named: "banner1")
        let image2 = UIImage(named: "banner2")
        let image3 = UIImage(named: "banner3")
        let image4 = UIImage(named: "banner4")
        let image5 = UIImage(named: "banner5")
        let image6 = UIImage(named: "banner6")
        let image7 = UIImage(named: "banner7")
        
        images.append(image1!)
        images.append(image2!)
        images.append(image3!)
        images.append(image4!)
        images.append(image5!)
        images.append(image6!)
        images.append(image7!)
        
        
    }
}